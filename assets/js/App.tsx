import React, { useEffect, useState } from "react"
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom"

import Cart from './pages/Cart'
import Home from './pages/Home'
import Login from './pages/Login'
import UserRoute from './UserRoute'
import Register from './pages/Register'
import Header from './components/Header'
import authService from './services/auth'

const App = () => {

  useEffect(() => {
    async function load() {
      await authService.loadUser()
    }
    load()
  }, [])

  return (
    <React.Fragment>
      <Router>
        <Header />
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/login" component={Login} />
          <Route exact path="/register" component={Register} />
          <Route exact path="/home" component={Home} />
          <UserRoute exact path="/cart" component={Cart} />
        </Switch>

      </Router>

    </React.Fragment>
  )
};
export default App;