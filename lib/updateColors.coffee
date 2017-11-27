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
      fs.writeFileSync syntax_variables, flavour_taste, "utf8"
      atom.config.set("pie-syntax-theme.choice",flavour)
      atom.packages.getActivePackages().filter((pack) -> pack.metadata.theme != 'undefined').forEach((pack) -> pack.reloadStylesheets())

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'pie-syntax-theme.choice', () ->
      updateColor()
