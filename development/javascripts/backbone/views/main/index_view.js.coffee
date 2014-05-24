Journalist.Views.Main ||= {}

class Journalist.Views.Main.IndexView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/index']

  id: "wrapper"

  header: =>
    header_view = new Journalist.Views.Main.HeaderView()
    header = $(@el).find('header')[0]
    $(header).html(header_view.render().el)

  user_info: =>
    user_info_view = new Journalist.Views.Main.UserInfoView()
    section = $(@el).find("#user-info")[0]
    $(section).html(user_info_view.render().el)

  render: =>
    $(@el).html(@template())
    @user_info()
    @header()
    return this
