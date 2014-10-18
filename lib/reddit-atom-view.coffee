{$, View} = require 'atom'

module.exports =
class RedditAtomView extends View
  @content: ->
    @div class: 'reddit-atom overlay from-top', =>
      @div class: 'message', =>
        @span 'Waiting for data…', outlet: 'message'

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  open: ->
    if @hasParent()
      @detach()
    else
      @message.text 'Waiting for data…'
      $.getJSON 'https://www.reddit.com/.json', (response) =>
        @message.text 'Got it!'
      atom.workspaceView.append(this)
