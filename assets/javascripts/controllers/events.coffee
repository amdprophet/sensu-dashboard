(->
  angular.module("sensuApp").controller "EventsController", [
    "$scope",
    "SensuEventsPoller",
    ($scope, SensuEventsPoller) ->
      $scope.message = "Events Page"

      $scope.sortByStatus = (event) ->
        status = switch event.status
          when 2 then 1 # critical
          when 1 then 2 # warning
          else 3 # unknown
        return status
  ]
)()
