
'use strict'

# =============================================
# angularLoadingBar
# =============================================
describe '\nConfig: Angular Loading Bar\n', ()->

  # =============================================
  # Import modules
  # =============================================
  beforeEach module('ui.router')
  beforeEach module('angular-loading-bar')



  # =============================================
  # Variables
  # =============================================
  angularLoadingBar = null

  # =============================================
  # Inject dependencies
  # =============================================
  beforeEach ->
    angular.module('mockProviderModule', ['angular-loading-bar']).config (_cfpLoadingBarProvider_) ->
      angularLoadingBar = _cfpLoadingBarProvider_
      spyOn(angularLoadingBar, 'includeSpinner')

    module('mockProviderModule')
    module('BBB.configs')

  beforeEach inject()


  # =============================================
  # Tests
  # =============================================
  describe 'Config loading bar on BBB', ->
    it 'Should enable spinner', ->
      expect(angularLoadingBar.includeSpinner).toBeFalsy()






