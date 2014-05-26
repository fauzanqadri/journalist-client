Journalist.Views.Main ||= {}
class Journalist.Views.Main.UnSignInView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/unsign_in']

  render: ()=>
    $(@el).html(@template({host: Journalist.MainHost}))
    return this
