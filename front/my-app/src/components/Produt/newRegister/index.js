import React from "react";
import Pesquisa from "../search";
import FormProduct from "../form";
import "../../css/NewRegister.css"; // Importe o arquivo de estilo CSS para adicionar a classe overlay

export default class NewRegister extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showFormProduct: false,
    };
  }

  handleCadastroProdutoClick = () => {
    this.setState({ showFormProduct: true });
  };

  handleCloseFormProduct = () => {
    this.setState({ showFormProduct: false });
  };

  render() {
    return (
      <div>
        <form className="d-flex form-control me-2">
          <Pesquisa />
          <div className="d-grid gap-2 col-2 mx-auto me-1">
            <button
              type="button"
              className="btn btn-primary"
              onClick={this.handleCadastroProdutoClick}
            >
              Cadastrar Produto
            </button>
          </div>
        </form>

        {/* Overlay escuro e FormProduct */}
        {this.state.showFormProduct && (
          <div className="overlay">
            <div className="form-product-container">
              <span
                className="close-btn"
                onClick={this.handleCloseFormProduct}
              >
                &times;
              </span>
              <FormProduct />
            </div>
          </div>
        )}
      </div>
    );
  }
}
