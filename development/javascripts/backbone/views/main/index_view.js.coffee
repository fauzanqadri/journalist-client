Journalist.Views.Main ||= {}
class Journalist.Views.Main.IndexView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/index']

  id: "wrapper"

  initialize: (options) ->
    @options ||= options
    @options.sign_in.bind('change', @sign_in)
    @localStorage ||= new Journalist.Tools.LocalStorage()
    @options.account.bind('change', @user_info)
    @journals = new Journalist.Collections.JournalCollection()

  sign_in: () =>
    if @options.sign_in.attributes.signed_in is true
      @createLocalStorage()
      @options.account.fetch()
      @renderJournalList()
      @journals.fetch({reset: true})
    else
      @localStorage.flush()
      @unsign_in()

  createLocalStorage: ()=>
    @localStorage.flush()
    @localStorage.set(@options.sign_in.attributes.api_key)

  renderJournalList: ()=>
    view = new Journalist.Views.Journal.IndexView(journals: @journals)
    section = $(@el).find("#main-content")[0]
    $(section).prepend(view.render().el)

  header: =>
    header_view = new Journalist.Views.Main.HeaderView()
    header = $(@el).find('header')[0]
    $(header).html(header_view.render().el)

  user_info: ()=>
    user_info_view = new Journalist.Views.Main.UserInfoView(account: @options.account)
    section = $(@el).find("#user-info")[0]
    $(section).html(user_info_view.render().el)

  unsign_in: () =>
    unsign_in_view = new Journalist.Views.Main.UnSignInView()
    section = $(@el).find("#user-info")[0]
    $(section).html(unsign_in_view.render().el)

  render: =>
    $(@el).html(@template())
    @header()
    return this
