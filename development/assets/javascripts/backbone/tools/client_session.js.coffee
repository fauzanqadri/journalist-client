class Journalist.Tools.ClientSession

  constructor: () ->
    @session = null
    @account = null
    @proxyAuthorization = null
    @apiStorage = new Journalist.Tools.LocalStorage.Storages.ApiKey()
    @proxyAuthStorage = new Journalist.Tools.LocalStorage.Storages.ProxyAuth()
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

  setProxyAuthorization: (proxy_auth) =>
    @proxyAuthorization = proxy_auth

  getProxyAuthorization: () =>
    return @proxyAuthorization

  isAuthorized: ()=>
    return @getSession().signed_in

  saveApiKey: ()=>
    value = @apiStorage.get()
    if typeof(value) is "undefined"
      @apiStorage.set(@getSession().api_key)
      @apiStorage.save()

  saveProxyAuth: ()=>
    value = @proxyAuthStorage.get()
    if typeof(value) is "undefined"
      @proxyAuthStorage.set(@getProxyAuthorization(), true)
      @proxyAuthStorage.save()

  saveClientInstance: ()=>
    value = @clientInstanceStorage.get()
    if typeof(value) is "undefined"
      @clientInstanceStorage.set(@clientInstance, true)
      @clientInstanceStorage.save()

  destroyApiKey: ()=>
    @apiStorage.destroy()

  destroyProxyAuth: () =>
    @proxyAuthStorage.destroy()

  destroyClientInstance: () =>
    @clientInstanceStorage.destroy()

  authorized: ()=>
    @saveApiKey()
    @saveProxyAuth()
    @saveClientInstance()

  unAuthorized: () =>
    @destroyApiKey()
    @destroyProxyAuth()
    @destroyClientInstance()
