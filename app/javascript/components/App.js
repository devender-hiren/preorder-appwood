import React from "react"
import PropTypes from "prop-types"

import MainContainer from "./common/main-container";
import Welcome from "./welcome";

class App extends React.Component {
  render () {
    return (
      <React.Fragment>
        <MainContainer>

          <Welcome />

        </MainContainer>
      </React.Fragment>
    );
  }
}

export default App
