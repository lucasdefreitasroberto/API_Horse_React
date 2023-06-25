import React, { component } from "react";
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
        </nav>
      </div>
    );
  }
}

export default Header;
