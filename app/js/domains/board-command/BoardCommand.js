import React from 'react';
import PropTypes from 'prop-types';

import {connect} from 'react-redux';

import createBoardCommandAction from './actions';

const mapDispatchProps = (dispatch, {action}) => ({
  onClick() {
    dispatch(createBoardCommandAction(action));
  }
});

const BoardCommand = ({
  children,
  onClick
}) => (
  <button onClick={onClick}>
    {children}
  </button>
);

BoardCommand.propTypes = {
  children: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired
};

export default connect(null, mapDispatchProps)(BoardCommand);
