class Journalist.Models.SignIn extends Backbone.Model
  url: Journalist.MainHost + "/sign_in_status.json"

  longPolling: false
  intervalMinutes: 2

  startLongPolling: (interval)=>
    @longPolling = true
    if interval
      @intervalMinutes = interval
    @executeLongPolling()

  stopLongPolling: =>
    @longPolling = false

  executeLongPolling: ()=>
    @fetch
      success: @onFetch

  onFetch: =>
    if @longPolling
      setTimeout(@executeLongPolling, 1000 * 60 * @intervalMinutes)
