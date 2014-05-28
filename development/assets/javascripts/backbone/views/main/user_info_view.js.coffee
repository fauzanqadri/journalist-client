Journalist.Views.Main ||= {}
class Journalist.Views.Main.UserInfoView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/user_info']

  initialize: (options)->
    @account = options.account

  render: =>
    $(@el).html(@template(@account.toJSON()))
    return this

