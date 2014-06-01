$(document).ready ->
  window.App = new Journalist.Routers.MainRouter()
  Backbone.history.start()
