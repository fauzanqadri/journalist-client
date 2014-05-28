Journalist.Views.Journal ||= {}
class Journalist.Views.Journal.IndexView extends Backbone.View
  template: JST["javascripts/backbone/templates/journals/index"]

  className: "warper"

  initialize: (options) ->
    @options ||= options
    @options.journals.bind('reset', @addAll)
    @clientInstanceStorage = new Journalist.Tools.LocalStorage.Storages.ClientInstance()

  addAll: =>
    @options.journals.each(@addOne)

  addOne: (journal) =>
    view = new Journalist.Views.Journal.JournalView(journal: journal, action: @)
    section = $(@el).find("#list-journal")[0]
    el = view.render().el
    $(el).data('id', journal.id)
    $(section).prepend(view.render().el)

  render: =>
    $(@el).html(@template())
    return this
