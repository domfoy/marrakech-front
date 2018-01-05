import _ from 'lodash';

import {combineReducers} from 'redux';

const currentTurn = (
  state = 0,
  action
) => {
  switch (action.type) {
    case 'GAME-VALIDATE_TURN':
      return state + 1;
    default:
      return state;
  }
};

const cells = (
  state = [],
  action
) => {
  switch (action.type) {
    // case 'GAME-LAY_RUG':
    //   const {cells: [cell1, cell2], colour} = action.payload;
    //   return
    default:
      if (state.length < 49) {
        return standardOverlay(state);
      }
      return state;
  }
};

export default combineReducers({
  currentTurn
});
