{View} = require 'atom'

module.exports =
class RedditAtomView extends View
  @content: ->
    @div class: 'reddit-atom overlay from-top', =>
      @div "The RedditAtom package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "reddit-atom:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "RedditAtomView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)