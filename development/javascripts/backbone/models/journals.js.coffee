class Journalist.Models.Journal extends Backbone.Model
  paramRoot: 'journal'

class Journalist.Collections.JournalCollection extends Backbone.Collection
  model: Journalist.Models.Journal
  url: Journalist.ApiHost + "/journals.json"
