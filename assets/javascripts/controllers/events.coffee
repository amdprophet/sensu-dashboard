(->
  angular.module("sensuApp").controller "EventsController", [
    "$scope",
    "SensuEvents",
    ($scope, SensuEvents) ->
      $scope.message = "Events Page"
      $scope.events = []

      $scope.sortByStatus = (event) ->
        status = switch event.check.status
          when 2 then 1 # critical
          when 1 then 2 # warning
          else 3 # unknown
        return status

      $scope.statusName = (event) ->
        return switch event.check.status
          when 2 then "critical"
          when 1 then "warning"
          else "unknown"

      $scope.isCritical = (event) ->
        event.check.status == 2

      $scope.isWarning = (event) ->
        event.check.status == 1

      $scope.isUnknown = (event) ->
        !($scope.isWarning(event) && $scope.isCritical(event))

      SensuEvents.query (response) ->
        $scope.events = response
  ]
)()
