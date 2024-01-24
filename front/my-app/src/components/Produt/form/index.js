import React from "react";

class FormProduct extends React.Component {
  render() {
    return (
      <form className="card d-flex form-control mx-auto ">
        <div class="card d-grid gap-20 col-30 mx-auto">
          <div class="card-body">
            <h3 class="card-title"><strong> Novo Produto</strong></h3>
            <div class="row g-3">
              <div class="col">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Nome Produto"
                  aria-label="Nome Produto"
                ></input>
              </div>
              <div class="col input-group mb-3">
              <span class="input-group-text">R$</span>
                <input
                  type="number"
                  class="form-control"
                  placeholder="Valor"
                  aria-label="Valor"
                ></input>
              </div>
              <div class="d-flex ">
                <button type="button" class="btn btn-primary">
                  Salvar
                </button>
                &nbsp;&nbsp;
                <button type="button" class="btn btn-secondary">
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

export default FormProduct;
