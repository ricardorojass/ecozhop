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
import authService from './services/auth'
import { User } from './types'


const App = () => {
  const [ authenticated, setAuthenticated ] = useState(false)

  useEffect(() => {
    authService.subscribe((_: User) => {
      setAuthenticated( authService.isAuthenticated() )
    })

    async function load() {
      console.log('load');

      await authService.loadUser()
    }
    load()

    return () => {
      authService.unsubscribe(load)
    }
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
        </Switch>

      </Router>

    </React.Fragment>
  )
};
export default App;