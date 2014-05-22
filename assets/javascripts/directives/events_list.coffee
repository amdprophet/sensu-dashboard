(->
  angular.module("sensuApp").directive "eventsList", ->
    return {
      templateUrl: "templates/events/list.html"
      controller: ($scope) ->
        $scope.isWarning = (status) ->
          return status == 1
        $scope.isCritical = (status) ->
          return status == 2
        $scope.isUnknown = (status) ->
          return status != 1 && status != 2
    }
)()
