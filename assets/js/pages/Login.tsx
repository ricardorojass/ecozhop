import React, { useState } from 'react'
import { useHistory } from 'react-router-dom'
import authService from '../services/auth'

const SigingPage = () => {
  const history = useHistory()

  const [data, setData] = useState({
    email: '',
    password: ''
  })

  const [errors, setErrors] = useState({});

  function updateField(name: string, value: string) {
    setData({ ...data, [name]:  value });
  }

  async function login(e) {
    e.preventDefault()
    try {
      const { email, password } = data
      setErrors({})
      await authService.login(email, password)
      history.push('/')
    } catch (e) {
      console.log(e)
      if (e.response && e.response.status == 401) {
        setErrors({ error: 'Wrong email or password. Try again.' })
      } else {
        setErrors({ error: e.message })
      }
    }
  }

  return (
    <div id="login">
      <div className="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
        <div className="max-w-md w-full">
          <div>
            <h2 className="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
              Sign in to your account
            </h2>
            <p className="mt-2 text-center text-sm leading-5 text-gray-600">
              Or
              <a href="#" className="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                create account
              </a>
            </p>
          </div>
          <form className="mt-8" onSubmit={login}>
            <input type="hidden" name="remember" value="true" />
            <div className="rounded-md shadow-sm">
              <div>
                <input
                  aria-label="Email address"
                  name="email"
                  type="email"
                  required
                  onChange={e => updateField('email', e.target.value)}
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:shadow-outline-blue focus:border-blue-300 focus:z-10 sm:text-sm sm:leading-5" placeholder="Email address" />
              </div>
              <div className="-mt-px">
                <input
                  aria-label="Password"
                  name="password"
                  type="password"
                  required
                  onChange={e => updateField('password', e.target.value)}
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:shadow-outline-blue focus:border-blue-300 focus:z-10 sm:text-sm sm:leading-5" placeholder="Password" />
              </div>
            </div>

            <div className="mt-6 flex items-center justify-between">
              {/* <div className="flex items-center">
                <label className="ml-2 block text-sm leading-5 text-gray-900">
                  Remember me
                  <input id="remember_me" type="checkbox" className="form-checkbox h-4 w-4 text-indigo-600 transition duration-150 ease-in-out" />
                </label>
              </div> */}

              <div className="text-sm leading-5">
                <a href="#" className="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                  Forgot your password?
                </a>
              </div>
            </div>

            <div className="mt-6">
              <button type="submit" className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                Sign in
              </button>
            </div>
          </form>
        </div>
      </div>

    </div>
  )

}

export default SigingPage