export default (socket, channelName = 'postAction') => {
  return ({dispatch}) => {
    socket.on('nextActionContext', dispatch);

    return next => action => {
      if (action.meta && action.meta.remote) {
        socket.emit(channelName, action.payload.gameAction);
      }
      return next(action);
    };
  };
};
