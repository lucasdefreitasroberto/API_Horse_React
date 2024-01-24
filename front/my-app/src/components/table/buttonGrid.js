import React from 'react';

class ButtonsGrid extends React.Component {
  render() {
    return (
      <div>
        <button type="button" className="btn btn-warning btn-sm">
         Editar
        </button>&nbsp;&nbsp;
        <button type="button" className="btn btn-danger btn-sm">
         Excluir
        </button>
      </div>
    );
  }
}

export default ButtonsGrid; 
