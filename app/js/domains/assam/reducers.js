import {combineReducers} from 'redux';

function turnLeft(state) {
  switch (state) {
    case 'U':
      return 'L';
    case 'L':
      return 'D';
    case 'D':
      return 'R';
    case 'R':
      return 'U';
    default:
      throw new Error('Bad direction:', state);
  }
}

function turnRight(state) {
  switch (state) {
    case 'U':
      return 'R';
    case 'R':
      return 'D';
    case 'D':
      return 'L';
    case 'L':
      return 'U';
    default:
      throw new Error('Bad direction:', state);
  }
}

const direction = (
  state = 'U',
  action
) => {
  switch (action.type) {
    case 'ASSAM-TURN':
      switch (action.payload.direction) {
        case 'L':
          return turnLeft(state);
        case 'R':
          return turnRight(state);
        default:
          throw new Error('Invalid payload', action.payload.direction);
      }
    default:
      return state;
  }
};

const cell = (
  state = 24,
  action
) => {
  switch (action) {
    case 'ASSAM-MOVE':
      return action.payload;
    default:
      return state;
  }
};

export default combineReducers({
  direction,
  cell
});
