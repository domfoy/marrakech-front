import {call} from 'redux-saga/effects';

import watchServerRequests from './handler';

export default function* (createSocket) {
  const socket = yield call(createSocket);

  yield watchServerRequests(socket);
}
