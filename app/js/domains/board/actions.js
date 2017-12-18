export const showSpinner = () => ({
  type: 'GAME-SHOW_SPINNER'
});
export const hideSpinner = () => ({
  type: 'GAME-HIDE_SPINNER'
});

export const postOrientAssam = () => {
  return (dispatch, getState) => {
    const state = getState();
    dispatch(showSpinner());

    return {
      meta: {
        remote: true
      },
      type: 'SERVER-ORIENT_ASSAM',
      payload: {
        direction: state.assam.direction
      }
    };
  };
};
