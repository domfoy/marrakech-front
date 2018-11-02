// Styles
require('./assets/styles/main.scss');

const io = require('socket.io-client');

// Elm
const { Elm } = require('./elm/Main.elm');
const app = Elm.Main.init({
    node: document.getElementById('elm-node')
});

app.ports.createSocket.subscribe(() => {
    const socket = io('http://localhost:8082');

    socket.on('event:game_created', (game) => {
        console.log('Game received', game);
        app.ports.newGame.send(game);
    });

    socket.on('event:new_pending_action_set', (actionContext) => {
        console.log('New pending action set', actionContext);
        app.ports.pendingAction.send(actionContext);
    });

    app.ports.submitAction.subscribe((action) => {
      console.log('Action submitted', action);
      socket.emit('event:action_submitted', action);
    })
});
