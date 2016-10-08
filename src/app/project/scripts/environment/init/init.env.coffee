
###
# Initialize agnostic components
###
window.agGrid?.initialiseAgGridWithAngular1(angular)

$(document).ready ->

  window.bbbEnv     or= {}
  setupData              = {}
  waitForSetup           = false
  bbbEnv              = window.bbbEnv
  window.bbbEnv.user  = null

  # Application Bootstrap
  bootstrap = ->
    angular.bootstrap(document, ["BBB"])

  bootstrap()