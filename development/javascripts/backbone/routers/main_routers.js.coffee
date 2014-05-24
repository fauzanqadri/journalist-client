class Journalist.Routers.MainRouter extends Backbone.Router

  initialize: ->

  routes:
    'index' : "index"
    '.*' : 'index'

  index: ->
    view = new Journalist.Views.Main.IndexView()
    $("body").prepend(view.render().el)
