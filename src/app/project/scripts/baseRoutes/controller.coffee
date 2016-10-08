

angular.module 'BBB.controllers'
  .controller 'BaseRouteController', (me, ActiveUser) ->

    ActiveUser.set('me', me.data)