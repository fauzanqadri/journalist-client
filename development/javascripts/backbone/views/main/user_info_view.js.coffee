Journalist.Views.Main ||= {}
class Journalist.Views.Main.UserInfoView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/user_info']
  render: =>
    $(@el).html(@template())
    return this
