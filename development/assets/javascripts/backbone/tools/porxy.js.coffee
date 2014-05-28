class Journalist.Tools.Proxy
  template: JST["javascripts/backbone/templates/tools/proxy"]

  constructor: () ->
    @journals = null

  setJournals: (journals) =>
    @journals = journals

  getJournals: () =>
    return @journals

  data: ()=>
    data =
      journals: @getJournals().toJSON()
      host: Journalist.ProxyHost
    return data

  configure: () =>
    pac_script = @template(@data())
    config =
      mode: "pac_script"
      pacScript:
        data: pac_script
    return config

  installProxy: =>
    chrome.proxy.settings.set
      value: @configure()
      scope: "regular"
    , ->
      console.log "Proxy Setup"

  removeProxy: =>
    chrome.proxy.settings.set
      value:
        mode: "direct"
    , ->
      console.log "Proxy Restore"
