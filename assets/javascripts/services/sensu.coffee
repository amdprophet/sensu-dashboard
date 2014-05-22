(->
  angular.module("sensuApp").factory "SensuEvents", ($resource) ->
    return $resource "http://localhost:8080/events", {},
      query:
        method: "GET",
        isArray: true
)()
