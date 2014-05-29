class Journalist.Tools.ClientSession

  constructor: () ->
    @session = null
    @account = null
    @apiStorage = new Journalist.Tools.LocalStorage.Storages.ApiKey()
    @clientInstanceStorage = new Journalist.Tools.LocalStorage.Storages.ClientInstance()
    @clientInstance = new Journalist.Tools.ClientInstance()
    @proxy = new Journalist.Tools.Proxy()

  setAccount: (account) =>
    @account = account

  getAccount: () =>
    return @account

  setSession: (session) =>
    @session = session

  getSession: () =>
    return @session

  isAuthorized: ()=>
    return @getSession().signed_in

  saveApiKey: ()=>
    value = @apiStorage.get()
    if typeof(value) is "undefined"
      @apiStorage.set(@getSession().api_key)
      @apiStorage.save()

  saveClientInstance: ()=>
    value = @clientInstanceStorage.get()
    if typeof(value) is "undefined"
      @clientInstanceStorage.set(@clientInstance, true)
      @clientInstanceStorage.save()

  destroyApiKey: ()=>
    @apiStorage.destroy()

  destroyClientInstance: () =>
    @clientInstanceStorage.destroy()

  authorized: ()=>
    @saveApiKey()
    @saveProxyAuth()
    @saveClientInstance()

  unAuthorized: () =>
    @destroyApiKey()
    @destroyClientInstance()
