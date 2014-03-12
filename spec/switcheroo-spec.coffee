{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe 'Switcheroo', ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    atom.workspaceView.attachToDom()
    activationPromise = atom.packages.activatePackage('switcheroo')

  describe "when the switcheroo:toggle event is triggered", ->
    it "toggle theme", ->
      defaultTheme = atom.config.get('core.themes')
      atom.workspaceView.trigger 'switcheroo:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        theme = atom.config.get('core.themes')
        expect(theme).not.toEqual(defaultTheme)

        expect(theme).toEqual(atom.config.get('switcheroo.themeTwo'))

        atom.workspaceView.trigger 'switcheroo:toggle'
        theme = atom.config.get('core.themes')
        expect(theme).toEqual(atom.config.get('switcheroo.themeOne'))
