import React from "react"

import { makeStyles } from '@material-ui/core/styles'
import Grid from '@material-ui/core/Grid'

const useStyles = makeStyles(theme => ({

  root: {
    flexGrow: 1,
    height: '100vh'
  }
}))


const App = () => {
  const classes = useStyles()

  return (
    <div className={classes.root}>
      <Grid container className="classes.root">
        <Grid item xs={12}>
          <h1>Welcome to my app with Typescript and React!</h1>
          <p>Peace-of-mind from prototype to production</p>
        </Grid>
      </Grid>

    </div>
  );
};
export default App;