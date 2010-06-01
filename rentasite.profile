<?php
// $Id$

/**
 * Implementation of hook_profile_details().
 */
function rentasite_profile_details() {
  return array(
    'name' => 'Rent A Site',
    'description' => 'Unified CMS platform with a set of maintainable on demand features.'
  );
}

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function rentasite_profile_modules() {
  $modules = array(
    'color',
    'help',
    'menu',
    'libraries',
    'taxonomy',
    'syslog',
    'locale',
    'dblog',
   );

  // performance tuners
  if (file_exists('./pressflow-6')) {
    $modules[] = 'cookie_cache_bypass';
    $modules[] = 'varnish';
  }

  return $modules;
}

/**
 * Returns an array list of core modules.
 */
function _rentasite_core_modules() {
  return array(
  // Contributed Modules
    'admin',
    'better_formats',
    'captcha',
    'context',
    'context_contrib',
    'context_ui',
    'ctools',
    'diff',
    'features',
    'htmlpurifier',
    'imce',
    'jquery_ui',
    'jquery_update',
    'nodewords',
    'nodewords_basic',
    'path',
    'pathauto',
    'strongarm',
    'token',
    'transliteration',
    'vertical_tabs',
  // Custom modules
    'rentasite',
  );
}

/**
 * Implementation of hook_profile_task_list().
 */
function rentasite_profile_task_list() {
  return array(
    'rentasite-configure' => st('Rent-A-Site configuration'),
  );
}

/**
 * Implementation of hook_profile_tasks().
 */
function rentasite_profile_tasks(&$task, $url) {
  global $install_locale;

  // Just in case some of the future tasks adds some output
  $output = '';

  if ($task == 'profile') {
    // Initialize core modules
    $modules = _rentasite_core_modules();
    $files = module_rebuild_cache();
    $operations = array();

    /**
     * FIXME: prevent vertical_tabs from initializing color stylesheet
     */
    variable_set('theme_default', 'nista');

    foreach ($modules as $module) {
      $operations[] = array('_install_module_batch', array($module, $files[$module]->info['name']));
    }
    $batch = array(
      'operations' => $operations,
      'finished' => '_rentasite_profile_batch_finished',
      'title' => st('Installing @drupal', array('@drupal' => drupal_install_profile_name())),
      'error_message' => st('The installation has encountered an error.'),
    );
    // Start a batch, switch to 'profile-install-batch' task. We need to
    // set the variable here, because batch_process() redirects.
    variable_set('install_task', 'profile-install-batch');
    batch_set($batch);
    batch_process($url, $url);
  }

  if ($task == 'rentasite-configure') {

    // Clear caches.
    drupal_flush_all_caches();

    // Enable the right theme. This must be handled after drupal_flush_all_caches()
    // which rebuilds the system table based on a stale static cache,
    // blowing away our changes.
    _rentasite_system_theme_data();
    db_query("UPDATE {system} SET status = 0 WHERE type = 'theme'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'zen'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'nista'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'nista'");
    variable_set('theme_default', 'nista');

    $task = 'finished';
  }

  return $output;
}

/**
 * Finished callback for the modules install batch.
 *
 * Advance installer task to language import.
 */
function _rentasite_profile_batch_finished($success, $results) {
  variable_set('install_task', 'rentasite-configure');
}

/**
 * Reimplementation of system_theme_data(). The core function's static cache
 * is populated during install prior to active install profile awareness.
 * This workaround makes enabling themes in profiles/rentasite/themes possible.
 */
function _rentasite_system_theme_data() {
  global $profile;
  $profile = 'rentasite';

  $themes = drupal_system_listing('\.info$', 'themes');
  $engines = drupal_system_listing('\.engine$', 'themes/engines');

  $defaults = system_theme_default();

  $sub_themes = array();
  foreach ($themes as $key => $theme) {
    $themes[$key]->info = drupal_parse_info_file($theme->filename) + $defaults;

    if (!empty($themes[$key]->info['base theme'])) {
      $sub_themes[] = $key;
    }

    $engine = $themes[$key]->info['engine'];
    if (isset($engines[$engine])) {
      $themes[$key]->owner = $engines[$engine]->filename;
      $themes[$key]->prefix = $engines[$engine]->name;
      $themes[$key]->template = TRUE;
    }

    // Give the stylesheets proper path information.
    $pathed_stylesheets = array();
    foreach ($themes[$key]->info['stylesheets'] as $media => $stylesheets) {
      foreach ($stylesheets as $stylesheet) {
        $pathed_stylesheets[$media][$stylesheet] = dirname($themes[$key]->filename) .'/'. $stylesheet;
      }
    }
    $themes[$key]->info['stylesheets'] = $pathed_stylesheets;

    // Give the scripts proper path information.
    $scripts = array();
    foreach ($themes[$key]->info['scripts'] as $script) {
      $scripts[$script] = dirname($themes[$key]->filename) .'/'. $script;
    }
    $themes[$key]->info['scripts'] = $scripts;

    // Give the screenshot proper path information.
    if (!empty($themes[$key]->info['screenshot'])) {
      $themes[$key]->info['screenshot'] = dirname($themes[$key]->filename) .'/'. $themes[$key]->info['screenshot'];
    }
  }

  foreach ($sub_themes as $key) {
    $themes[$key]->base_themes = system_find_base_themes($themes, $key);
    // Don't proceed if there was a problem with the root base theme.
    if (!current($themes[$key]->base_themes)) {
      continue;
    }
    $base_key = key($themes[$key]->base_themes);
    foreach (array_keys($themes[$key]->base_themes) as $base_theme) {
      $themes[$base_theme]->sub_themes[$key] = $themes[$key]->info['name'];
    }
    // Copy the 'owner' and 'engine' over if the top level theme uses a
    // theme engine.
    if (isset($themes[$base_key]->owner)) {
      if (isset($themes[$base_key]->info['engine'])) {
        $themes[$key]->info['engine'] = $themes[$base_key]->info['engine'];
        $themes[$key]->owner = $themes[$base_key]->owner;
        $themes[$key]->prefix = $themes[$base_key]->prefix;
      }
      else {
        $themes[$key]->prefix = $key;
      }
    }
  }

  // Extract current files from database.
  system_get_files_database($themes, 'theme');
  db_query("DELETE FROM {system} WHERE type = 'theme'");
  foreach ($themes as $theme) {
    $theme->owner = !isset($theme->owner) ? '' : $theme->owner;
    db_query("INSERT INTO {system} (name, owner, info, type, filename, status, throttle, bootstrap) VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d, %d)", $theme->name, $theme->owner, serialize($theme->info), 'theme', $theme->filename, isset($theme->status) ? $theme->status : 0, 0, 0);
  }
}
