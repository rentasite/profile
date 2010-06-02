; $Id$

core = 6.x

; Contrib projects
projects[apachesolr][subdir] = "contrib"
projects[admin][subdir] = "contrib"
projects[admin][version] = "2.0-beta3"
projects[advanced_help][subdir] = "contrib"
projects[backup_migrate][subdir] = "contrib"
projects[better_formats][subdir] = "contrib"
projects[captcha][subdir] = "contrib"
projects[cck][subdir] = "contrib"
projects[color_soc08][subdir] = "contrib"
projects[conditional_styles][subdir] = "contrib"
projects[ctools][subdir] = "contrib"
projects[custom_pagers][subdir] = "contrib"
projects[custom_pagers][version] = "1.0-beta2"
projects[dialog][subdir] = "contrib"
projects[diff][subdir] = "contrib"
projects[faq][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[filefield][subdir] = "contrib"
projects[flag][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"
projects[imagefield_crop][subdir] = "contrib"
projects[imce][subdir] = "contrib"
projects[imce_wysiwyg][subdir] = "contrib"
projects[jquery_plugin][subdir] = "contrib"
projects[jquery_slideshow][subdir] = "contrib"
projects[jquery_ui][subdir] = "contrib"
projects[jquery_update][subdir] = "contrib"
projects[libraries][subdir] = "contrib"
projects[lightbox2][subdir] = "contrib"
projects[memcache][subdir] = "contrib"
projects[memcache][version] = "1.5-rc1"
projects[menu_icons][subdir] = "contrib"
projects[mimedetect][subdir] = "contrib"
projects[nice_menus][subdir] = "contrib"
projects[nodereference_url][subdir] = "contrib"
projects[nodewords][subdir] = "contrib"
projects[panels][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[r4032login][subdir] = "contrib"
projects[schema][subdir] = "contrib"
projects[simplenews][subdir] = "contrib"
projects[strongarm][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[transliteration][subdir] = "contrib"
projects[ubercart][subdir] = "contrib"
projects[uc_wishlist][subdir] = "contrib"
projects[uc_termsofservice][subdir] = "contrib"
projects[varnish][subdir] = "contrib"
projects[vertical_tabs][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[views_attach][subdir] = "contrib"
projects[views_bonus][subdir] = "contrib"
projects[views_gallery][subdir] = "contrib"
projects[views_slideshow][subdir] = "contrib"
projects[webform][subdir] = "contrib"
projects[webformblock][subdir] = "contrib"
projects[wysiwyg][subdir] = "contrib"

; Features
projects[wysiwyg_ckeditor][type] = "module"
projects[wysiwyg_ckeditor][download][type] = "git"
projects[wysiwyg_ckeditor][download][url] = "git://github.com/rentasite/wysiwyg_ckeditor.git"
projects[wysiwyg_ckeditor][download][branch] = "master"
projects[wysiwyg_ckeditor][subdir] = "features"

; Themes
projects[] = zen
projects[] = nista

; Patched.
; Explicit versions specified to ensure patches apply cleanly.

; [#606816] Node forms drop out of context on validation error
projects[context][subdir] = "contrib"
projects[context][version] = "2.0-beta7"
projects[context][patch][] = "http://drupal.org/files/issues/606816-1_node_form_context.patch"

; [#708266] decouple location of htmlpurifier library
projects[htmlpurifier][subdir] = "contrib"
projects[htmlpurifier][version] = "2.1"
projects[htmlpurifier][patch][] = "http://drupal.org/files/issues/htmlpurifier-library_0.patch"

; [#670174] swfupload as library
projects[image_fupload][subdir] = "contrib"
projects[image_fupload][version] = "3.0-rc2"
projects[image_fupload][patch][] = "http://drupal.org/files/issues/image_fupload-swfupload_as_library_1.patch"

; [#681352] use jscroller2 for better w3c compatibility
projects[scrolltext][subdir] = "contrib"
projects[scrolltext][version] = "1.0-alpha1"
projects[scrolltext][patch][] = "http://drupal.org/files/issues/scrolltext-using_jscroller2.patch"

; Libraries
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.1/ckeditor_3.1.tar.gz"
libraries[htmlpurifier][download][type] = "get"
libraries[htmlpurifier][download][url] = "http://htmlpurifier.org/releases/htmlpurifier-4.1.1-lite.tar.gz"
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui
libraries[jscroller2][download][type] = "raw"
libraries[jscroller2][download][url][] = "http://jscroller2.googlecode.com/files/jscroller2-1.61.js"
libraries[jscroller2][download][url][] = "http://jscroller2.googlecode.com/files/jscroller2-1.1.css"
libraries[swfupload][download][type] = "get"
libraries[swfupload][download][url] = "http://cloud.github.com/downloads/rentasite/library_swfupload/SWFUpload_v2.2.0.1_Core.tar.gz"

; ApacheSolr
libraries[SolrPhpClient][download][type] = "get"
libraries[SolrPhpClient][download][url] = "http://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.tgz"
libraries[SolrPhpClient][directory_name] = "SolrPhpClient"
libraries[SolrPhpClient][destination] = "modules/contrib/apachesolr"
