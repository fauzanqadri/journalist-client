#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./routers
#= require_tree ./views
#= require_tree ./tools
#= require_tree ./tools/storages

window.Journalist =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Tools: {}
  MainHost: "http://journalist.local"
  ApiHost: "http://api.journalist.local"
  ProxyHost: "localhost:3001"
