import { createStore, applyMiddleware } from 'redux';
import createSagaMiddleware from 'redux-saga';

import app from './reducers';
import initialState from './initial-state';
import saga from '../../middlewares/saga';

const sagaMiddleware = createSagaMiddleware();

const store = createStore(
  app,
  initialState,
  applyMiddleware(sagaMiddleware)
);

sagaMiddleware.run(saga);

export default store;
