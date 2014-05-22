(->
  angular.module("sensuApp").controller "StashesController", [
    "$scope",
    ($scope) ->
      $scope.message = "Stashes Page"
  ]
)()
