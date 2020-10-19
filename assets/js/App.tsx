import React, { useEffect, useState } from "react"
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom"

import Home from './pages/Home'
import Login from './pages/Login'
import Register from './pages/Register'
import Header from './components/Header'

const App = () => {

  return (
    <React.Fragment>
      <Router>
        <Header />
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/login" component={Login} />
          <Route exact path="/register" component={Register} />
        </Switch>

      </Router>

    </React.Fragment>
  )
};
export default App;