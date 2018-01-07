import _ from 'lodash';
import { takeEvery, take, put, call, fork} from 'redux-saga/effects';
import {eventChannel, buffers} from 'redux-saga';

export default function* watchServerRequests(socket) {
  const socketChannel = yield call(createSocketChannel, socket);

  socket.emit('socket-player_ready', 'hi');

  yield takeEvery(socketChannel, handleInCommunication, socket);
}

export function createSocketChannel(socket) {
  return eventChannel(emit => {
    const serverCommunication = (event) => {
      emit(event);
      socket.emit('socket-server_request_ack', 'hi');
    };

    socket.on('socket-server_request', serverCommunication);

    const unsubscribe = () => {
      socket.off('socket-server_request', serverCommunication);
    };

    return unsubscribe;
  }, buffers.fixed(2));
}

export function* handleInCommunication(socket, serverAction) {
  yield put(serverAction);
  yield fork(handleResponseToServer, socket, serverAction.meta.id);
  yield put({type: 'PLAYER-RESPONSE_VALIDATE_ACTION', meta: serverAction.meta});
}

function* handleResponseToServer(socket, expectedId) {
  const awaitedActionFilter = buildFilter(expectedId);
  yield take(awaitedActionFilter);
  const responseToServer = yield call(buildActionFromState);
  yield call([socket, socket.emit], 'socket-player_response', responseToServer);
}

function buildActionFromState() {
  return {
    assam: 12
  };
}

function buildFilter(expectedId) {
  return (action) => {
    return action
      && action.type === 'PLAYER-RESPONSE_VALIDATE_ACTION'
      && _.get(action.meta, 'id') === expectedId;
  };
}
