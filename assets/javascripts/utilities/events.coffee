(->
  angular.module("sensuApp").run ($rootScope) ->
    $rootScope.Util =
      eventStatusFromName: (statusName) ->
        return switch statusName.toLowerCase()
          when "critical" then 2
          when "warning" then 1
          when "unknown" then 3
)()
