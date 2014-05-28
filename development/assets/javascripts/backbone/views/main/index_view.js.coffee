Journalist.Views.Main ||= {}
class Journalist.Views.Main.IndexView extends Backbone.View
  template: JST['javascripts/backbone/templates/main/index']

  id: "wrapper"

  initialize: (options) ->
    @options ||= options
    @clientSession = new Journalist.Tools.ClientSession()
    @journals = new Journalist.Collections.JournalCollection()
    @options.sign_in.bind('change', @authorization)
    @options.account.bind('change', @setAccountSession)

  setAccountSession: () =>
    @clientSession.setAccount(@options.account.toJSON())
    @clientSession.setProxyAuthorization(@options.account.authorization.toJSON().proxy)
    @clientSession.saveProxyAuth()

  authorization: () =>
    @clientSession.setSession(@options.sign_in.toJSON())
    if @clientSession.isAuthorized()
      @clientSession.saveApiKey()
      @options.account.fetch
        success: @accountFetchSuccess
    else
      @clientSession.unAuthorized()
      @unsign_in()

  accountFetchSuccess: () =>
    @userInfo()
    @renderJournalList()
    @journals.fetch
      reset: true
      success: @journalFetchSuccess

  journalFetchSuccess: ()=>
    @clientSession.saveClientInstance()
    @clientSession.proxy.setJournals(@journals)
    @clientSession.proxy.installProxy()

  renderJournalList: ()=>
    view = new Journalist.Views.Journal.IndexView(journals: @journals)
    section = $(@el).find("#main-content")[0]
    $(section).prepend(view.render().el)

  header: =>
    header_view = new Journalist.Views.Main.HeaderView()
    header = $(@el).find('header')[0]
    $(header).html(header_view.render().el)

  userInfo: ()=>
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
