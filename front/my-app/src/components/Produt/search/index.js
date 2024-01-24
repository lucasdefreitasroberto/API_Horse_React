import React from "react";

export default class search extends React.Component {
  render() {
    return (
      <form class="d-flex gap-2 col-5 " role="search">
        <input
          class="form-control me-2"
          type="search"
          placeholder="Pesquisar"
          aria-label="Pesquisar"
        ></input>
        <button class="btn btn-outline-success" type="submit">
          Pesquisar
        </button>
      </form>
    );
  }
}
