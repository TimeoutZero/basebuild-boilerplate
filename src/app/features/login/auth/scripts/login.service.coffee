###
# LoginService
###
angular.module 'BBB.services'
  .service 'LoginService', (APP_ENV, $http, $q, $localStorage) ->

    ###
    # baseUrl
    ###
    baseUrl = "#{APP_ENV.CORE_API_URL}"


    ###
    # API
    ###
    return API = {

      successLoginState: 'app.sidebarTheme.overview.dashboard'

      me: () ->
        return $http
          method: 'GET'
          url   : "#{baseUrl}user/me"

      login: (data = {}, config = {}) ->
        angular.extend config,
          method : 'POST'
          url    : "#{baseUrl}login"
          data   : data

        return $http(config)

      logout: () ->
        delete $localStorage.jwt
        return $q.when()

    }