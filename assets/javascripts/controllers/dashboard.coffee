(->
  angular.module("sensuApp").controller "DashboardController", [
    "$scope",
    "SensuEvents",
    "CONFIG",
    ($scope, SensuEvents, CONFIG) ->
      $scope.message = "Sensu Dashboard"
      $scope.events = []

      console.log CONFIG

      $scope.criticalEvents = ->
        results = []
        angular.forEach $scope.events, (event, index) ->
          if event.check.status == 2
            results.push event
        return results

      $scope.warningEvents = ->
        results = []
        angular.forEach $scope.events, (event, index) ->
          if event.check.status == 1
            results.push event
        return results

      $scope.unknownEvents = ->
        results = []
        angular.forEach $scope.events, (event, index) ->
          if [0, 1, 2].indexOf(event.check.status) == -1
            results.push event
        return results

      SensuEvents.query (response) ->
        $scope.events = response
  ]
)()
