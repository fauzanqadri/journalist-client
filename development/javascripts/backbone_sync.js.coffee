(($) ->
  Backbone._sync = Backbone.sync
  Backbone.sync = (method, model, options) ->
    api_key = localStorage['api_token']
    if typeof(api_key) isnt "undefinded"
      options.headers =
        'X-Api-Key' : api_key
    Backbone._sync method, model, options
  return
) jQuery
