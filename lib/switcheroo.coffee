module.exports =
  configDefaults: {
    themeOne: ['atom-dark-ui', 'atom-dark-syntax']
    themeTwo: ['atom-light-ui', 'atom-light-syntax']
  }

  activate: (state) ->
    atom.workspaceView.command "switcheroo:toggle", => @toggle()

  toggle: ->
    @currentTheme = atom.config.get('core.themes')
    themeOne = atom.config.get('switcheroo.themeOne')
    themeTwo = atom.config.get('switcheroo.themeTwo')
    isThemeOne = @currentTheme[0] == themeOne[0] and @currentTheme[1] == themeOne[1]
    atom.config.set('core.themes', if isThemeOne then themeTwo else themeOne)
