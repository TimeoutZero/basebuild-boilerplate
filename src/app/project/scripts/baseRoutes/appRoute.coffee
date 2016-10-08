

###
  ## Login base route
###
angular.module 'BBB'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/sidebar/home'

    $stateProvider
      .state "app",
        url         : "/"
        abstract    : yes
        views:
          '':
            template : "<div ui-view class='full-height'></div>"
            controller  : 'BaseRouteController'
        resolve     :
          me: ['LoginService', '$q', (LoginService, $q) ->
            # return LoginService.me()
            return $q.when(data: null)
          ]



      .state "app.sidebarTheme",
        url         : "sidebar"
        views:
          '@app':
            templateUrl : "app/project/scripts/baseRoutes/sidebarTheme.html"

          # 'sidenav@app.sidebarTheme':
          #   controller : 'SidenavController as sidenav'
          #   templateUrl : "app/components/sidenav/template.html"

          # 'topnav@app.sidebarTheme':
          #   controller : 'TopNavbarController as topNavbar'
          #   templateUrl: "app/components/topNavbar/template.html"

