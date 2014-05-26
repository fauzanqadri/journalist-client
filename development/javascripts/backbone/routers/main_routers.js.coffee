class Journalist.Routers.MainRouter extends Backbone.Router

  initialize: (options) ->
    @sign_in = new Journalist.Models.SignIn()
    @account = new Journalist.Models.Account()

  routes:
    'index' : "index"
    '.*' : 'index'

  index: ->
    @view = new Journalist.Views.Main.IndexView(sign_in: @sign_in, account: @account)
    $("body").prepend(@view.render().el)
    @sign_in.fetch()
