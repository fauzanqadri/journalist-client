Journalist.Views.Main ||= {}
class Journalist.Views.Main.HeaderView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/header']

  render: =>
    $(@el).html(@template())
    return this
