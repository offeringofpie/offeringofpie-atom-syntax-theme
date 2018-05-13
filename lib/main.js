const fs = require('fs');
const path = require('path');

module.exports = {
  activate: state => {
    atom.config.observe('pie-syntax-theme.choice', value => {
      return setTheme(value);
    });
  }
};

setTheme = theme => {
  const flavour = theme.replace(/\s+/g, '-').toLowerCase();
  syntax_variables = __dirname + '/../styles/scheme.less';
  flavour_file = __dirname + '/themes/' + flavour + '.less';
  flavour_taste = fs.readFileSync(flavour_file, 'utf8');
  fs.writeFileSync(syntax_variables, flavour_taste, 'utf8');
  return atom.packages
    .getActivePackages()
    .filter(pack => {
      return pack.metadata.theme !== 'undefined';
    })
    .forEach(pack => {
      return pack.reloadStylesheets();
    });
};
