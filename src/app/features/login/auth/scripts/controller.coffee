'use strict'

# =============================================
# Module
# =============================================
angular.module 'BBB.controllers'
  .controller 'LoginAuthController', ($scope, $state, $stateParams, ActiveUser, LoginService, $localStorage, $hIntercom, $window) ->

    # =============================================
    # Attributes
    # =============================================
    ctrl         = @
    ctrl.langKey = 'LOGIN_FEATURE'

    ctrl.user =
      email    : null
      password : null

    ctrl.options =
      isSubmiting       : no

    # =============================================
    # Initialize
    # =============================================

    # =============================================
    # Methods
    # =============================================

    ctrl.actions =

      login  : ->
        unless ctrl.options.isSubmiting
          ctrl.options.isSubmiting = yes
          promise = LoginService.login ctrl.user

          promise.then (res)->
            if ActiveUser.get('me')
              $hIntercom.init
                user    : ActiveUser.get('me')

            $state.go LoginService.successLoginState
            return

          promise.catch (res) ->
            ActiveUser.set('me', null)
            ctrl.options.isSubmiting = no

          return

    # Aux Methods
    # ===============================




    # =============================================
    # Initialize
    # =============================================

    return @
