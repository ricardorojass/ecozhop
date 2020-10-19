
import React from 'react';
import { Redirect } from 'react-router-dom'
import Loading from '../components/Loading'
import authService from '../services/auth'
import { useStore } from '../hooks'
import { User } from '../types'

export default () => {
  // const user = useStore<User>(authService)

  return (
    <>
      <h2>
        Welcome To The Ecozhop Application
      </h2>
      <p>
        One day, this will be your feed.
      </p>
    </>
  );
}