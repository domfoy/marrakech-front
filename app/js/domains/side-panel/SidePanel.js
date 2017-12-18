import React from 'react';

import {connect} from 'react-redux';

import BoardCommand from '../board-command/BoardCommand';

const SidePanel = () => (
  <div>
    <BoardCommand action="validateGameAction">
      Validate
    </BoardCommand>
  </div>
);

export default connect(
)(SidePanel);
