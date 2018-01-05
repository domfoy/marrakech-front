import io from 'socket.io-client';

import {call, all} from 'redux-saga/effects';
import {channel} from 'redux-saga';

import watchInCommunication from './in';
import watchOutCommunication from './out';

export default function* () {
  const socket = yield call(createSocket);
  const inOutChan = yield call(channel);

  yield all([
    watchInCommunication(socket, inOutChan),
    watchOutCommunication(socket, inOutChan)
  ]);
}

function createSocket() {
  return io('http://localhost:8082');
}
