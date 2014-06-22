(->
  angular.module("sensuApp").filter "eventStatus", [
    "$rootScope",
    ($rootScope) ->
      return (events, statusName) ->
        if !angular.isUndefined(events) && !angular.isUndefined(statusName)
          tmpEvents = []
          angular.forEach events, (event) ->
            status = event.check.status
            statusFromName = $rootScope.Util.eventStatusFromName(statusName)
            if status == statusFromName
              tmpEvents.push(event)
          return tmpEvents
  ]
)()
