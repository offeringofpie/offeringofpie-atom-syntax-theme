module.exports =
  config:
    choice:
      title: 'Color Theme'
      description: 'What\'s is your flavour?'
      type: 'string'
      default: 'Dark'
      enum: [
        'Dark',
        'Light'
      ]
  activate: (state) ->
    atom.config.onDidChange 'pie-syntax-theme.choice', () ->
      Update = require './updateColors'
      Update.apply()
