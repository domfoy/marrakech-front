import {takeEvery, put, call, fork} from 'redux-saga/effects';
import {eventChannel} from 'redux-saga';

export default function* watchInCommunication(socket, inOutChan) {
  const socketChannel = yield call(createSocketChannel, socket);

  yield takeEvery(socketChannel, handleInCommunication, inOutChan);
}

function createSocketChannel(socket) {
  return eventChannel(emit => {
    const serverCommunication = (event) => {
      emit(event);
    };

    socket.on('ping', serverCommunication);

    const unsubscribe = () => {
      socket.off('ping', serverCommunication);
    };

    return unsubscribe;
  });
}

function* handleInCommunication(inOutChan, serverMessage) {
  yield put('SERVER-PENDING-REQUEST-ADDED', serverMessage.id);
  yield put(serverMessage);
  yield fork(ackResponseSentToServer, inOutChan, serverMessage);
}

function* ackResponseSentToServer(inOutChan, serverMessage) {
  yield take('SERVER-PENDING-RESPONSE-ADDED', serverMessage.id);
}
