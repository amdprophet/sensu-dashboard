(->
  getConfig = ->
    jQuery.ajax({
      type: "GET"
      url: "config.json"
      async: false
      dataType: "json"
    }).responseJSON

  angular.module("sensuApp.config", []).constant "CONFIG", getConfig()
)()
