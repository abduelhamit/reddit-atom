RedditAtomView = require './reddit-atom-view'

module.exports =
  redditAtomView: null

  activate: (state) ->
    @redditAtomView = new RedditAtomView(state.redditAtomViewState)

  deactivate: ->
    @redditAtomView.destroy()

  serialize: ->
    redditAtomViewState: @redditAtomView.serialize()
