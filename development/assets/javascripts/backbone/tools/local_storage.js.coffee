Journalist.Tools.LocalStorage ||= {}
class Journalist.Tools.LocalStorage.Base

  constructor: ()->
    @key ||= ""
    @value ||= {}
    @initialize()

  initialize: ()->
    throw "Not yet implemented"

  save: () =>
    window.localStorage.setItem(@key, @value)

  set: (value, stringify = false) =>
    if stringify
      value = JSON.stringify(value)
    @value = value

  get: () =>
    window.localStorage[@key]

  destroy: () =>
    window.localStorage.removeItem(@key)
