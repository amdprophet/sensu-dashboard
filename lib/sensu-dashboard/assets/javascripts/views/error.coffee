namespace "SensuDashboard.Views", (exports) ->

  class exports.Error extends SensuDashboard.Views.Base

    __name__: "ErrorView"

    el: $("#main")

    name: "error"

    initialize: ->
      @template_data =
        title: "Oh no!" ? @options.title
        message: "Something isn't right. Try refreshing." ? @options.message
      @render()

    render: ->
      @$el.html(@template(@template_data))
      this
