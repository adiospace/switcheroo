{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe 'Switcheroo', ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('switcheroo')

  describe "when the switcheroo:toggle event is triggered", ->
    it "toggle theme", ->
      workspaceView = atom.views.getView(atom.workspace)
      defaultTheme = atom.config.get('core.themes')
      atom.commands.dispatch workspaceView, 'switcheroo:toggle'

      theme = atom.config.get('core.themes')
      expect(theme).not.toEqual(defaultTheme)

      expect(theme).toEqual(atom.config.get('switcheroo.themeOne'))

      atom.commands.dispatch workspaceView, 'switcheroo:toggle'
      theme = atom.config.get('core.themes')
      expect(theme).toEqual(atom.config.get('switcheroo.themeTwo'))
