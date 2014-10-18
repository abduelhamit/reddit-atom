RedditAtomView = require './reddit-atom-view'

module.exports =
  redditAtomView: null

  activate: (state) ->
    atom.workspaceView.command 'reddit-atom:open', =>
      @redditAtomView ?= new RedditAtomView(state.redditAtomViewState)
      @redditAtomView.open()

  deactivate: ->
    @redditAtomView.destroy()

  serialize: ->
    redditAtomViewState: @redditAtomView.serialize()
