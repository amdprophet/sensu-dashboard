(->
  angular.module("sensuApp").controller "MainController", [
    "$scope",
    "$location",
    ($scope, $location) ->
      $scope.isActive = (route) ->
        return route == $location.path()
  ]
)()
