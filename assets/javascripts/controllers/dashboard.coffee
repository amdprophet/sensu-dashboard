(->
  angular.module("sensuApp").controller "EventsController", [
    "$scope",
    "sensuEvents",
    ($scope, SensuEvents) ->
      $scope.message = "Sensu Dashboard"

      $scope.sortByStatus = (event) ->
        status = switch event.status
          when 2 then 1 # critical
          when 1 then 2 # warning
          else 3 # unknown
        return status

      $scope.events = {}

      SensuEvents.query (response) ->
        $scope.events = response
  ]
)()
