class Journalist.Models.Account extends Backbone.Model
  url: Journalist.ApiHost + "/account.json"

  initialize: ()->
    @authorization = new Journalist.Models.Authorization()

  parse: (data) =>
    @authorization.set(data.authorization)
    delete data['authorization']
    return data
