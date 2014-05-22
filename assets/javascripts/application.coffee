(->
  app = angular.module("sensuApp", [
    "ngResource",
    "ngRoute",
    "ngAnimate",
  ])

  app.config [
    "$routeProvider",
    "$locationProvider",
    ($routeProvider, $locationProvider) ->
      $routeProvider

      .when "/",
        redirectTo: "/dashboard"

      .when "/dashboard",
        templateUrl: "templates/dashboard/index.html",
        controller: "DashboardController"

      .when "/events",
        templateUrl: "templates/events/index.html",
        controller: "EventsController"

      .when "/stashes",
        templateUrl: "templates/stashes/index.html",
        controller: "StashesController"

      .when "/clients",
        templateUrl: "templates/clients/index.html",
        controller: "ClientsController"

      .when "/checks",
        templateUrl: "templates/checks/index.html",
        controller: "ChecksController"

      .when "/info",
        templateUrl: "templates/info/index.html",
        controller: "InfoController"

      .otherwise
        redirectTo: "/events"

      # Use the HTML5 History API (Disabled for now)
      $locationProvider.html5Mode false
  ]
)()
