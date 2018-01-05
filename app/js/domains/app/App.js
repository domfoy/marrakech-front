import React from 'react';

import {Provider} from 'react-redux';
import store from './store';

import Board from '../board/Board';
import SidePanel from '../side-panel/SidePanel';

const App = () => (
  <Provider store={store}>
    <section id="view">
      <Board />
      <SidePanel />
    </section>
  </Provider>
);

export default App;
