import React from 'react';
import PropTypes from 'prop-types';

import {connect} from 'react-redux';

import BoardCommand from '../board-command/BoardCommand';
import Overlay from './Overlay';
import Assam from '../assam/Assam';

const mapStateProps = (state) => ({assam: state.board.assam});

const Board = ({assam}) => (
  <div>
    <h2 id="heading">Hello ReacaatJS</h2>
    <div style={{
      display: 'flex',
      justifyContent: 'center',
      minWidth: '300px',
      minHeight: '300px'
    }}
    >
      <section>
        <div
          id="board"
          style={{
            position: 'relative',
            height: '50vw',
            width: '50vw',
            backgroundColor: '#665235',
            maxWidth: '50vh',
            maxHeight: '50vh',
            minWidth: '300px',
            minHeight: '300px',
            border: '10px solid chocolate',
            borderRadius: '10px'
          }}
        >
          <Overlay/>
          <Assam/>
        </div>
      </section>
    </div>
    <div>
      <a>Assam</a>
      <div>Direction: {assam.direction}</div>
      <div>Cell:{assam.cell}</div>
    </div>
    <BoardCommand action="turnAssamLeft">
      Turn left
    </BoardCommand>
    <BoardCommand action="turnAssamRight">
      Turn right
    </BoardCommand>
  </div>
);

export default connect(
  mapStateProps
)(Board);

Board.propTypes = {
  assam: PropTypes.shape({
    direction: PropTypes.string,
    cell: PropTypes.number.isRequired
  }).isRequired
};
