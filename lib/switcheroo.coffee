module.exports =
  config: {
    themeOne:
      type: 'array'
      default: ['one-dark-ui', 'one-dark-syntax']
    themeTwo:
      type: 'array'
      default: ['one-light-ui', 'one-light-syntax']
  }

  activate: (state) ->
    atom.commands.add "atom-workspace", "switcheroo:toggle", => @toggle()

  toggle: ->
    @currentTheme = atom.config.get('core.themes')
    themeOne = atom.config.get('switcheroo.themeOne')
    themeTwo = atom.config.get('switcheroo.themeTwo')
    isThemeOne = @currentTheme[0] == themeOne[0] and @currentTheme[1] == themeOne[1]
    atom.config.set('core.themes', if isThemeOne then themeTwo else themeOne)
