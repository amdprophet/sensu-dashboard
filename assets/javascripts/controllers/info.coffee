(->
  angular.module("sensuApp").controller "InfoController", [
    "$scope",
    ($scope) ->
      $scope.message = "Info Page"
  ]
)()
