(->
  angular.module("sensuApp").controller "ChecksController", [
    "$scope",
    ($scope) ->
      $scope.message = "Checks Page"
  ]
)()
