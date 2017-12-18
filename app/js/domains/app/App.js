import React from 'react';
import io from 'socket.io-client';

import {Provider} from 'react-redux';
import {createStore, applyMiddleware} from 'redux';
import thunk from 'redux-thunk';
import socketMiddlewareCreator from '../../middlewares/socket';

import app from './reducers';
import Board from '../board/Board';
import SidePanel from '../side-panel/SidePanel';

const nitialState = {
  board: {
    assam: {
      direction: 'R',
      cell: 2
    },
    cells: [
      {
        id: 12,
        colour: 'B',
        rugId: 1
      },
      {
        id: 13,
        colour: 'B',
        rugId: 1
      }
    ]
  }
};

const store = createStore(
  app,
  nitialState,
  applyMiddleware(
    thunk,
    socketMiddlewareCreator(io('http://localhost:8082'))
  )
);

const App = () => (
  <Provider store={store}>
    <section id="view">
      <Board />
      <SidePanel />
    </section>
  </Provider>
);

export default App;
