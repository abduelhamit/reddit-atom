RedditAtomView = require './reddit-atom-view'

module.exports =
  redditAtomView: null

  activate: ->
    atom.workspaceView.command 'reddit-atom:open', =>
      @redditAtomView ?= new RedditAtomView()
      @redditAtomView.open()

  deactivate: ->
    @redditAtomView.destroy()
