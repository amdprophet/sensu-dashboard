(->
  angular.module("sensuApp").directive "eventsCounts", [
    "",
    () ->
      return {
        templateUrl: "templates/events/counts.html",
        controller: ($scope, SensuEventsPoller) ->
          data = SensuEventsPoller
          $scope.critical = 6
          $scope.warning = 2
          $scope.unknown = 1
          $scope.total = data.events
    }
  ]
)()
