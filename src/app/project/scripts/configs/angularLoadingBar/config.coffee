'use strict'

angular.module 'BBB.configs'
  .config [ 'cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeSpinner   = no
    cfpLoadingBarProvider.latencyThreshold = 250
  ]
