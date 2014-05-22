(->
  angular.module("sensuApp").controller "ClientsController", [
    "$scope",
    ($scope) ->
      $scope.message = "Clients Page"
  ]
)()
