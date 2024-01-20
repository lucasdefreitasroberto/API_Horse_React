import React, { Component } from "react";
import api from "../../services/api";

export default class Table extends Component {
  state = {
    _product: [],
  };

  async componentDidMount() {
    const response = await api.get("/products/");
    this.setState({ _product: response.data });
    console.log(response.data);
  }

  render() {
    return (
      <table class="table table-striped table-bordered">
        <thead class="table-warning">
          <tr>
            <th scope="col">Código</th>
            <th scope="col">Descrição</th>
            <th scope="col">Valor</th>
          </tr>
        </thead>
        <tbody>
          {this.state._product.map((produto) => {
            return (
              <tr>
                <th scope="row" width="50" height="50">{produto.id}</th>
                <td >{produto.name}</td>
                <td >{"R$ "+produto.price + ",00"}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    );
  }
}
