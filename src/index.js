// Styles
require('./assets/styles/main.scss');

// Elm
const { Elm } = require('./elm/Main.elm');
Elm.Main.init({
  node: document.getElementById('elm-node')
});

console.log(12);
