class Journalist.Tools.LocalStorage

  constructor: ()->
    @local_storage_key ||= "api_token"

  set: (value) =>
    localStorage.setItem(@local_storage_key, value)

  get: () =>
    localStorage[@local_storage_key]

  flush: () =>
    localStorage.removeItem(@local_storage_key)
