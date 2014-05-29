Journalist.Tools.LocalStorage.Storages ||= {}
class Journalist.Tools.LocalStorage.Storages.ClientInstance extends Journalist.Tools.LocalStorage.Base

  initialize: ()->
    @key = "client_instance"

  find: (id) =>
    if typeof(@get()) isnt "undefined"
      return  _.find JSON.parse(@get()), (obj) =>
      obj.id is id

  remove: (id) =>
    res = @find(id)
    the_cook = []
    if typeof(res) isnt "undefined"
      _.each res.cookies, (obj)->
        chrome.cookies.remove
          url: obj.url
          name: obj.name
    if typeof(@get()) isnt "undefined"
      data = _.reject JSON.parse(@get()), (obj) =>
        obj.id is id
      @set(data, true)
      @save()

  destroy: ()=>
    the_cook = []
    if typeof(@get()) isnt "undefined"
      datas = JSON.parse(@get())
      _.each datas, (obj) ->
        _.each obj.cookies, (ob) ->
          chrome.cookies.remove
            url: obj.url
            name: ob.name
    window.localStorage.removeItem(@key)
