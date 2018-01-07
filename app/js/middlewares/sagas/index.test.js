import test from 'ava';
import {expectSaga} from 'redux-saga-test-plan';
import {call} from 'redux-saga/effects';
import SocketMock from 'socket.io-mock';

import saga from './index';
import {createSocketChannel} from './handler';

const socket = new SocketMock();
const serverRequest = {
  type: 'SERVER-REQUEST-ADDED',
  payload: {neededInfo: 'assam.oriention'},
  meta: {id: 1}
};

socket.on('socket-player_ready', () => {
  socket.emit('socket-server_request', serverRequest);
});

test('watches inbound/outbound communications', t => {
  t.plan(2); // socket-player_response is sent twice because
  // providers call their mocked value at initialization

  socket.on('socket-player_response', (socketAction) => {
    console.log('YESSSSSS I received', socketAction);
    t.pass();
  });

  return expectSaga(saga, createSocket)
    .provide([
      [call(createSocket), socket.socketClient],
      [call(createSocketChannel), socket.socketClient],
      [call(socket.socketClient.emit), socket.socketClient.emit('socket-player_response', {})]
    ])
    .run();
});

function createSocket() {
  return socket.socketClient;
}
