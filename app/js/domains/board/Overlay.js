import React from 'react';
import PropTypes from 'prop-types';

import {connect} from 'react-redux';

const mapStateProps = (state) => {
  return {cells: state.board.cells};
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

function getColor(cellColour) {
  switch (cellColour) {
    case 'B':
      return 'cornflowerblue';
    case 'N':
    default:
      return 'beige';
  }
}

function getGridCoord(cellId) {
  return {
    row: 7 - Math.floor(cellId / 7),
    col: 1 + (cellId % 7)
  };
}

const getCellStyle = (cell) => {
  const background = getColor(cell.colour);
  const {col, row} = getGridCoord(cell.id);
  return {
    width: '100%',
    hieght: '100%',
    // boxShadow: 'inset 2px 2px 0 rgba(255, 255, 255, 0.05), inset -2px -2px 0 #665235',
    background,
    gridColumnStart: col,
    gridRowStart: row
  };
};

const Overlay = ({cells}) => {
  const cellsHtml = cells.map(cell =>
    (<span key={cell.id} style={getCellStyle(cell)}/>)
  );
  return (<div id="overlay" style={overlayStyle}>
    {cellsHtml}
  </div>);
};

export default connect(
  mapStateProps
)(Overlay);

Overlay.propTypes = {
  cells: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      colour: PropTypes.string.isRequired
    }).isRequired
  ).isRequired
};
