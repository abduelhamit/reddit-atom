{$} = require 'atom'
TextEditor = require 'atom/../src/text-editor'
TextBuffer = require 'atom/../node_modules/text-buffer/lib/text-buffer'

module.exports =
class RedditAtomView extends TextEditor
  constructor: (uri) ->
    super
      buffer: new TextBuffer()
    @setPlaceholderText 'Loading…'
    @open uri

  open: (uri) ->
    uri = '/' if !uri? or uri == ''
    $.getJSON "https://www.reddit.com#{uri}.json", (response) =>
      @insertText 'Got it!'
