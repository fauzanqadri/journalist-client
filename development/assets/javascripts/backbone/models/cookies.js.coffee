class Journalist.Models.Cookie extends Backbone.Model

class Journalist.Collections.CookiesCollection extends Backbone.Collection
  model: Journalist.Models.Cookie

  url: ->
    Journalist.ApiHost + "/journals/#{@journal.id}" + "/cookies.json"

  initialize: (options)->
    @journal = options.journal

