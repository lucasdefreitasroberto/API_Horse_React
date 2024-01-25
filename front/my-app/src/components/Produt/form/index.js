import React from "react";
import PropTypes from "prop-types";
import api from "../../../services/api";

class FormProduct extends React.Component {
  state = {
    productName: "",
    productValue: "",
  };

  handleInputChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value,
    });
  };

  handleSaveClick = async () => {
    const { productName, productValue } = this.state;

    //Verifica se os campos obrigatórios estão preenchidos
    if (productName === '' || productValue === '') {
      alert('Por favor, preencha todos os campos obrigatórios.');
      return;  //Cancela a execução da função
    }

    try {
      const response = await api.post("/products", {        
        name: productName.toUpperCase(),
        price: productValue.toUpperCase(),
      });

      console.log("Produto salvo:", response.data);

      // Recarrega a página após o POST bem-sucedido
      window.location.reload();

      // Se necessário, você pode adicionar mais lógica aqui
      // Por exemplo, chamar uma função que atualiza o estado ou realiza outras operações

      if (this.props.onCancel) {
        this.props.onCancel();
      }
    } catch (error) {
      console.error("Erro ao salvar produto:", error);
    }
  };

  handleCancelClick = () => {
    if (this.props.onCancel) {
      this.props.onCancel();
    }
  };

  render() {
    return (
      <form className="card d-flex form-control mx-auto">
        <div className="card d-grid gap-20 col-30 mx-auto">
          <div className="card-body">
            <h3 className="card-title">
              <strong> Novo Produto</strong>
            </h3>
            <div className="row g-3">
              <div className="col form-row col-8">
                <input
                  type="text"
                  className="form-control"
                  placeholder="Nome Produto"
                  aria-label="Nome Produto"
                  name="productName"
                  onChange={this.handleInputChange}
                  required
                />
              </div>
              <div className="col input-group mb-2">
                <span className="input-group-text">R$</span>
                <input
                  type="number"
                  className="form-control"
                  placeholder="Valor"
                  aria-label="Valor"
                  name="productValue"
                  onChange={this.handleInputChange}
                  required
                />
              </div>
              <div className="d-flex gap-20 col-30 mx-auto">
                <button
                  type="button"
                  className="btn btn-primary"
                  onClick={this.handleSaveClick}
                >
                  Salvar
                </button>
                &nbsp;&nbsp; &nbsp;&nbsp;
                <button
                  type="button"
                  className="btn btn-secondary"
                  onClick={this.handleCancelClick}
                >
                  Cancelar
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    );
  }
}

FormProduct.propTypes = {
  onCancel: PropTypes.func.isRequired,
};

export default FormProduct;
