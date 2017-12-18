import {validateGameAction} from '../app/actions';
import {turnAssamLeft, turnAssamRight} from '../assam/actions';
import {postOrientAssam} from '../board/actions';

export default (action) => {
  switch (action) {
    case 'turnAssamLeft':
      return turnAssamLeft();
    case 'turnAssamRight':
      return turnAssamRight();
    case 'postOrientAssam':
      return postOrientAssam();
    case 'validateGameAction':
      return validateGameAction();
    default:
      throw new Error('Invalid action type in BoardCommand', action);
  }
};
