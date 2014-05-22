(->
  angular.module("sensuApp").factory "SensuEventsPoller", [
    "$timeout",
    "SensuEvents",
    ($timeout, SensuEvents) ->
      data = { events: [] }
      poller = ->
        SensuEvents.query (response) ->
          data.events = response
          $timeout poller, 1000
      poller()
      return data
  ]
)()
