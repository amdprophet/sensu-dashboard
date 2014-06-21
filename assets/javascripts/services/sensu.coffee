(->
  angular.module("sensuApp").factory "SensuEvents", ($resource) ->
    resource = $resource "http://localhost:4567/events", {},
      query:
        method: "GET",
        isArray: true,
        headers:
          Authorization: "Basic " + btoa("foo:bar")
)()
