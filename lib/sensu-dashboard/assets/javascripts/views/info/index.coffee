namespace "SensuDashboard.Views.Info", (exports) ->

  class exports.Index extends SensuDashboard.Views.Base

    __name__: "InfoIndexView"

    name: "info/index"

    initialize: ->
      @listenTo(@model, "destroy", @render)
      @listenTo(@model, "change", @render)

    render: ->
      @$el.html(@template(@model.toJSON()))
      this
