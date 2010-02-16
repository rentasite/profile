; $Id$

core = 6.x

; Contrib projects
projects[admin][subdir] = "contrib"
projects[admin][version] = "2.0-alpha5"
projects[advanced_help][subdir] = "contrib"
projects[better_formats][subdir] = "contrib"
projects[captcha][subdir] = "contrib"
projects[cck][subdir] = "contrib"
projects[ckeditor][subdir] = "contrib"
projects[color_soc08][subdir] = "contrib"
projects[conditional_styles][subdir] = "contrib"
projects[ctools][subdir] = "contrib"
projects[custom_pagers][subdir] = "contrib"
projects[dialog][subdir] = "contrib"
projects[diff][subdir] = "contrib"
projects[faq][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[filefield][subdir] = "contrib"
projects[flag][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"
projects[imagefield_crop][subdir] = "contrib"
projects[imce][subdir] = "contrib"
projects[jquery_plugin][subdir] = "contrib"
projects[jquery_slideshow][subdir] = "contrib"
projects[jquery_ui][subdir] = "contrib"
projects[jquery_update][subdir] = "contrib"
projects[libraries][subdir] = "contrib"
projects[lightbox2][subdir] = "contrib"
projects[mimedetect][subdir] = "contrib"
projects[nice_menus][subdir] = "contrib"
projects[nodereference_url][subdir] = "contrib"
projects[nodewords][subdir] = "contrib"
projects[panels][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[schema][subdir] = "contrib"
projects[simplenews][subdir] = "contrib"
projects[strongarm][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[transliteration][subdir] = "contrib"
projects[ubercart][subdir] = "contrib"
projects[uc_wishlist][subdir] = "contrib"
projects[uc_termsofservice][subdir] = "contrib"
projects[vertical_tabs][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[views_attach][subdir] = "contrib"
projects[views_bonus][subdir] = "contrib"
projects[views_gallery][subdir] = "contrib"
projects[views_slideshow][subdir] = "contrib"
projects[webform][subdir] = "contrib"

; Custom projects
projects[rentasite][type] = "module"
projects[rentasite][download][type] = "git"
projects[rentasite][download][url] = "git://github.com/rentasite/module.git"
projects[rentasite][download][branch] = "master"
projects[rentasite][subdir] = "custom"

; Features
projects[pages][type] = "module"
projects[pages][download][type] = "git"
projects[pages][download][url] = "git://github.com/rentasite/pages.git"
projects[pages][download][branch] = "master"
projects[pages][subdir] = "features"

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
libraries[htmlpurifier][download][url] = "http://htmlpurifier.org/releases/htmlpurifier-4.0.0-lite.tar.gz"
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui
libraries[jscroller2][download][type] = "raw"
libraries[jscroller2][download][url][] = "http://jscroller2.googlecode.com/files/jscroller2-1.61.js"
libraries[jscroller2][download][url][] = "http://jscroller2.googlecode.com/files/jscroller2-1.1.css"
libraries[swfupload][download][type] = "get"
libraries[swfupload][download][url] = "http://cloud.github.com/downloads/rentasite/library_swfupload/SWFUpload_v2.2.0.1_Core.tar.gz"
