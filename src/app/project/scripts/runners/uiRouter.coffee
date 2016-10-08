
# =============================================
# Module
# =============================================
angular.module 'BBB'
  .run ['$rootScope', ($rootScope) ->

    $rootScope.$on '$stateChangeError' , (event, toState, toParams, fromState, fromParams, error) ->
      console.group()
      console.log('[$stateChangeError]')
      console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
      console.groupEnd()
      event.preventDefault()


    # $rootScope.$on '$stateChangeStart' , (event, toState, toParams, fromState, fromParams, error) ->
    #   console.group()
    #   console.log('[$stateChangeStart]')
    #   console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
    #   console.groupEnd()

    # $rootScope.$on '$stateChangeSuccess' , (event, toState, toParams, fromState, fromParams, error) ->
    #   console.group()
    #   console.log('[$stateChangeSuccess]')
    #   console.table([event, toState, toParams, fromState, fromParams, error], ['name', 'url', 'resolve', 'message'])
    #   console.groupEnd()
  ]

