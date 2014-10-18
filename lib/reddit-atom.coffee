RedditAtomView = require './reddit-atom-view'

redditUri = 'reddit://'

module.exports =
  redditAtomOpener: null

  activate: ->
    @redditAtomOpener = atom.workspace.addOpener (uri) ->
      if uri.startsWith redditUri
        new RedditAtomView uri.substr redditUri.length

    atom.workspaceView.command 'reddit-atom:open', ->
      atom.workspace.open redditUri + '/'

  deactivate: ->
    @redditAtomOpener.dispose()
