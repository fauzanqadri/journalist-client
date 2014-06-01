Journalist.Views.Journal ||= {}
class Journalist.Views.Journal.JournalView extends Backbone.View
  template: JST['javascripts/backbone/templates/journals/journal']

  tagName: "a"

  className: "list-group-item"

  events:
    'click' : 'openTab'

  initialize: (options)->
    @options ||= options
    @model = @options.journal
    @action = @options.action

  openTab: () =>
    id = $(@el).data('id')
    model = @action.options.journals.get(id)
    @fetchCookies(model) #if model.attributes.online_accounts_count > 0

  fetchCookies: (model)=>
    @cookies = new Journalist.Collections.CookiesCollection(journal: model)
    @cookies.fetch
      success: @success
      error: @error

  success: () =>
    @cookie_jar = []
    @cookies.each(@injectCookie)
    chrome.tabs.create
      url: @model.attributes.url
    , @createCallBack

  createCallBack: (tab)=>
    client_instance =
      id: tab.id
      windowId: tab.windowId
      journal: @model.toJSON()
      cookies: @cookie_jar
    instance = new Journalist.Models.ClientInstance()
    instance.set(client_instance)
    storage = JSON.parse(@action.clientInstanceStorage.get())
    storage.push(instance.toJSON())
    @action.clientInstanceStorage.set(storage, true)
    @action.clientInstanceStorage.save()

  injectCookie: (cookie)=>
    @cookie_jar.push(cookie.toJSON())
    chrome.cookies.set(cookie.toJSON())

  error: ()=>
    console.log "Error"

  render: =>
    $(@el).html(@template(@model.toJSON()))
    return this

