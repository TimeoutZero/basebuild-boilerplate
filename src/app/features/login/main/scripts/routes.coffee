'use strict'

# =============================================
# Module
# =============================================
angular.module 'BBB'
  .config ($stateProvider, $urlRouterProvider) ->

    # States
    # =============================================
    $stateProvider

      .state('login'
        url         : '/login'
        templateUrl : 'app/features/login/main/templates/main.html'
        controller  : 'LoginParentController'
        abstract    : yes
        resolve:
          lang:  ['$translatePartialLoader', '$q', ($translatePartialLoader, $q) ->
            promises = [
              $translatePartialLoader.addPart('app/features/login/main/i18n')
            ]
            return $q.all(promises)
          ]
      )

      .state('login.auth',
        url         : '/auth?redirect'
        templateUrl : 'app/features/login/auth/template.html'
        controller  : 'LoginAuthController as login'
        params:
          redirect: null
        resolve     :
          me: ['LoginService', '$timeout', '$localStorage', '$state', (LoginService, $timeout, $localStorage, $state) ->
            return $timeout ->
              if $localStorage.jwt
                $state.go LoginService.successLoginState
          ]
      )



