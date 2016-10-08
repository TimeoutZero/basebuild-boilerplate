

# =============================================
# Main Module
# =============================================
angular.module 'BBB'
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "app.sidebarTheme.home",
        url  : "/home"
        views:
          'main@app.sidebarTheme':
            templateUrl: 'app/features/home/main/templates/main.html'

      .state "app.sidebarTheme.overview.dashboard",
        url  : "/dashboard?date&customer&department&user"
        views:
          'dashboard@app.sidebarTheme.home':
            templateUrl : 'app/features/home/dashboard/templates/main.html'
            controller  : 'OverviewDashboardController as dashboard'

          'dashForm@app.sidebarTheme.home':
            templateUrl : 'app/features/home/dashboard/subviews/dashForm/template.html'
            controller  : 'OverviewDashFormController as dashForm'


