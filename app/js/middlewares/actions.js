export const validateGameAction = () => ({
  type: 'PLAYER-VALIDATE_ACTION',
  meta: {
    remote: true
  },
  payload: {
    gameAction
  }
});

export default validateGameAction;
