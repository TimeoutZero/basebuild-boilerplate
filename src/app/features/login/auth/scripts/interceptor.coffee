
# =============================================
# Module
# =============================================
angular.module 'BBB'
  .config( ['$httpProvider', '$provide', ($httpProvider, $provide) ->

    # =============================================
    # UserLoginInterceptor
    # =============================================
    $provide.factory 'UserLoginInterceptor', [ '$q', '$injector', '$rootScope', '$localStorage', ($q, $injector, $rootScope, $localStorage) ->

      'request': (config) ->
        if $localStorage.jwt?
          config.headers['authorization'] = $localStorage.jwt
        return config

      'requestError': (rejection)->
        return $q.reject rejection

      'response': (response)->
        jwt               = response.headers()["authorization"]
        $localStorage.jwt = jwt if jwt?
        return response or $q.when response

      'responseError': (rejection)->
        if rejection.status is 401 or rejection.status is 403
          $injector.invoke ['$state', 'ActiveUser', '$translate', '$location', '$window', 'APP_ENV'
          ($state, ActiveUser, $translate, $location, $window, APP_ENV) ->

            blockedKeys =
              "user.started.new.session" : yes
              "Access is denied"         : yes
              "Access Denied"            : yes
              "Access denied"            : yes

            if rejection.status is 401 or blockedKeys[rejection.data?.reason]
              ActiveUser.resetUserAndPermissions()
              delete $localStorage.jwt
              redirectURL = $window.encodeURIComponent($location.absUrl())

              if $state.get(APP_ENV.LOGIN_PAGE_URL)
                $state.go APP_ENV.LOGIN_PAGE_URL,
                  redirect: redirectURL
              else
                $window.location.href = "#{APP_ENV.LOGIN_PAGE_URL}?redirect=#{redirectURL}"
          ]

        return  $q.reject rejection

    ]

    # =============================================
    # Register Interceptor
    # =============================================
    $httpProvider.interceptors.push 'UserLoginInterceptor'

  ])
