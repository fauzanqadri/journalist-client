Journalist.Views.Journal ||= {}
class Journalist.Views.Journal.JournalView extends Backbone.View
  template: JST['javascripts/backbone/templates/journals/journal']

  tagName: "a"

  className: "list-group-item"

  events:
    'click' : 'openTab'

  initialize: (options)->
    @options ||= options
    @model = @options.journal
    @action = @options.action

  openTab: () ->
    id = $(@el).data('id')
    model = @action.options.journals.get(id)
    model

  render: =>
    $(@el).html(@template(@model.toJSON()))
    return this

