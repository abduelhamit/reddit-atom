{WorkspaceView} = require 'atom'
RedditAtom = require '../lib/reddit-atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RedditAtom", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('reddit-atom')

  describe "when the reddit-atom:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.reddit-atom')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'reddit-atom:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.reddit-atom')).toExist()
        atom.workspaceView.trigger 'reddit-atom:toggle'
        expect(atom.workspaceView.find('.reddit-atom')).not.toExist()
