

angular.module  'BBB.factories'
  .factory 'ActiveUser', () ->

    userData =
      permissions : null
      me          : null
      company     : null

    return API = {

      get: (attr) ->
        return angular.copy userData[attr]

      set: (attr, val) ->
        return userData[attr] = val

      isLogged: () ->
        return userData.me?

      reset: (attr) ->
        userData[attr] = null

      resetUserAndPermissions: () ->
        userData.permissions = null
        userData.me          = null

    }