{$, View} = require 'atom'

module.exports =
class RedditAtomView extends View
  @content: ->
    @div class: 'reddit-atom overlay from-top', =>
      @div class: 'message', =>
        @span 'Waiting for data…', outlet: 'message'

  initialize: ->
    @open()
    @

  # Tear down any state and detach
  destroy: ->
    @detach()

  open: (uri) ->
    uri = '/' if !uri? or uri == ''
    @message.text 'Waiting for data…'
    $.getJSON "https://www.reddit.com#{uri}.json", (response) =>
      @message.text 'Got it!'

  getTitle: ->
    'Reddit'
