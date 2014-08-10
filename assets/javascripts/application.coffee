(->
  app = angular.module("sensuApp", [
    "ngResource",
    "ngAnimate",
    "ui.router",
    "sensuApp.config",
  ])

  app.config [
    "$stateProvider",
    "$urlRouterProvider",
    "$locationProvider",
    "$httpProvider",
    ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
      $httpProvider.defaults.useXDomain = true
      delete $httpProvider.defaults.headers.common['X-Requested-With']

      $urlRouterProvider.otherwise("/")

      $stateProvider
        .state "sensu",
          url: "/"
          views:
            navbar:
              templateUrl: "templates/navbar.html"

        .state "dashboard",
          url: "/dashboard"
          views:
            navbar:
              templateUrl: "templates/navbar.html"
            content:
              templateUrl: "templates/dashboard/index.html"
              controller: "DashboardController"

        .state "events",
          url: "^/events"
          views:
            navbar:
              templateUrl: "templates/navbar.html"
            content:
              templateUrl: "templates/events/index.html"
              controller: "EventsController"

        .state "clients",
          url: "/clients"
          templateUrl: "templates/clients/index.html"
          controller: "ClientsController"

        .state "stashes",
          url: "/stashes"
          templateUrl: "templates/stashes/index.html"
          controller: "StashesController"

        .state "checks",
          url: "/checks"
          templateUrl: "templates/stashes/index.html"
          controller: "ChecksController"

        .state "info",
          url: "/info"
          templateUrl: "templates/info/index.html"
          controller: "InfoController"
  ]
)()
