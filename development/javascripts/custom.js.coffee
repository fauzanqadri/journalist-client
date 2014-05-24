$(document).ready ->
  window.router = new Journalist.Routers.MainRouter()
  Backbone.history.start()

