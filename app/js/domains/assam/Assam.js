import React from 'react';
import PropTypes from 'prop-types';

import {connect} from 'react-redux';

const mapStateProps = (state) => {
  return {
    cell: state.board.assam.cell,
    direction: state.board.assam.direction
  };
};

const overlayStyle = {
  position: 'absolute',
  top: 0,
  left: 0,
  height: '100%',
  width: '100%',
  display: 'grid',
  'grid-template-columns': 'repeat(7, 1fr)',
  'grid-template-rows': 'repeat(7, 1fr)',
  'grid-gap': '2px',
  padding: '0 2px 2px 0',
  boxSizing: 'border-box'
};

function getGridCoord(cellId) {
  return {
    row: 7 - Math.floor(cellId / 7),
    col: 1 + (cellId % 7)
  };
}

const getCellStyle = (cell) => {
  const {col, row} = getGridCoord(cell);
  return {
    width: '100%',
    hieght: '100%',
    border: '100% solid black',
    borderRadius: '50%',
    gridColumnStart: col,
    gridRowStart: row
  };
};

const Assam = ({cell, direction}) => {
  return (<div id="assam" style={overlayStyle}>
    <span style={getCellStyle(cell)}>{direction}</span>
  </div>);
};

export default connect(
  mapStateProps
)(Assam);

Assam.propTypes = {
  cell: PropTypes.number.isRequired,
  direction: PropTypes.string.isRequired
};
