angular.module "BBB.vendors", [
  'ngAnimate'
  'ngCookies'
  'ngTouch'
  'ngSanitize'
  'ngMessages'
  'ngAria'
  'ngResource'
  'ui.router'
  'ui.bootstrap'
  'ui.select'
  'tmh.dynamicLocale'
  'ngStorage'
  'agGrid'
  'ngFileUpload'
  'infinite-scroll'

  # Inspinia
  'angular-ladda'
  'angular-loading-bar'
  'toastr'
  "oitozero.ngSweetAlert"
]

# =============================================
# Modules
# =============================================
angular.module "BBB.controllers" , ["BBB.vendors"]
angular.module "BBB.filters"     , ["BBB.vendors"]
angular.module "BBB.factories"   , ["BBB.vendors"]
angular.module "BBB.constants"   , ["BBB.vendors"]
angular.module "BBB.services"    , ["BBB.vendors"]
angular.module "BBB.directives"  , ["BBB.vendors"]
angular.module "BBB.mocks"       , ["BBB.vendors"]
angular.module "BBB.i18n"        , ["BBB.vendors"]
angular.module "BBB.configs"     , ["BBB.vendors"]
angular.module "BBB.providers"   , ["BBB.vendors"]



# =============================================
# Scripts Module
# =============================================
angular.module "BBB.scripts"     , [
  "BBB.controllers"
  "BBB.constants"
  "BBB.filters"
  "BBB.factories"
  "BBB.services"
  "BBB.directives"
  "BBB.mocks"
  "BBB.i18n"
  "BBB.providers"
  "BBB.configs"
]


# =============================================
# Main Module
# =============================================
angular.module "BBB", [
  "BBB.scripts"
  "BBB.vendors"
]