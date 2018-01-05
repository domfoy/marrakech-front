import {take, put, apply, select} from 'redux-saga/effects';

export default function* watchOutCommunication(socket, inOutChan) {
  const { action, messageId } = yield take('PLAYER-VALIDATE_ACTION', retrieveGameInfo);

  yield take('SERVER-PENDING-REQUEST-ADDED', messageId);
  yield apply(socket, socket.emit, action);
  yield put('SERVER-PENDING-RESPONSE-ADDED', messageId);
}

function* retrieveGameInfo() {
  const state = yield select(_.identity);

  const action = buildAction(state);
}