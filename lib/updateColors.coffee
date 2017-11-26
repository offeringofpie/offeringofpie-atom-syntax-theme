fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    updateColor = () ->
      flavour = atom.config.get "pie-syntax-theme.choice"
      flavour = flavour.replace(/\s+/g, '-').toLowerCase()
      syntax_variables = "#{__dirname}/../styles/syntax-variables.less"
      flavour_file = "#{__dirname}/themes/" + flavour + ".less"
      flavour_taste = fs.readFileSync flavour_file, "utf8"
      fs.writeFile syntax_variables, flavour_taste, "utf8", (err) ->
        console.log err
      atom.config.set("pie-syntax-theme.choice",flavour)

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'pie-syntax-theme.choice', () ->
      updateColor()
