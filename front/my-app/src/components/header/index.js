import React from "react";
import Menu from "../menu/index";

class Header extends React.Component {
  render() {
    return (
      <div>       
        <nav
          class="navbar bg-dark border-bottom border-bottom-dark"
          data-bs-theme="dark"
        >      
          <Menu />
          <a class="navbar-brand"> <h2>Produto </h2><h1>&nbsp;</h1></a>
        </nav>
      </div>
    );
  }
}

export default Header;
