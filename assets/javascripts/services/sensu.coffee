(->
  angular.module("sensuApp").factory "SensuEvents", ($resource) ->
    resource = $resource "http://"+location.hostname+":4567/events", {},
      query:
        method: "GET",
        isArray: true,
        headers:
          Authorization: "Basic " + btoa("foo:bar")
)()
