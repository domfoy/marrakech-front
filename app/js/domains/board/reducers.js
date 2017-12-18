import _ from 'lodash';

import {combineReducers} from 'redux';

import assam from '../assam/reducers';


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

function standardOverlay(partialCells) {
  const alreadyInCellIds = _.map(partialCells, 'id');

  const toAddCellIds = _.difference(_.times(49), alreadyInCellIds);

  const toAddCells = _.map(toAddCellIds, id => ({
    id,
    colour: 'N'
  }));

  return [...partialCells, ...toAddCells];
}

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
  currentTurn,
  assam,
  cells
});
