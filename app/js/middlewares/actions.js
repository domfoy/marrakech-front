export const validateGameAction = () => ({
  type: 'GAME-VALIDATE_ACTION',
  meta: {
    remote: true
  },
  payload: {
    gameAction
  }
});

export default validateGameAction;
