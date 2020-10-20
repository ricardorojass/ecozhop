import React, { useEffect, useState } from 'react'
import { useHistory } from 'react-router-dom'
import authService from '../services/auth'
import { User } from '../types'

const SearchBar = () => {
  const history = useHistory()

  const [authenticated, setAuthenticated] = useState(false)

  useEffect(() => {
    authService.subscribe((_: User) => {
      setAuthenticated(authService.isAuthenticated())
      console.log(authenticated);

    })
  })

  function onClick() {
    history.push('/login')
  }

  return (
    <div id="navigation-bar">
      <div className="flex bg-orange-900 h-16 z-100 items-center">
        <div className="w-full max-w-screen-xl relative mx-auto px-6">
          <div className="flex items-center -mx-6">
            <div className="lg:w-0 lg:flex-1 pl-4">
              <div className="flex items-center">
                <a href="#" className="block">
                  <h1 className="text-2xl text-white">Ecozhop</h1>
                </a>
              </div>
            </div>
            <div className="flex flex-grow min-w-0 lg:w-3/4 xl:w-4/5">
              <div className="w-3/5 min-w-0 lg:px-6 xl:w-3/4 xl:px-12">
                <div className="relative">
                  <form>
                    <label>
                      {/* TODO add search icon */}
                    </label>
                    <input
                      type="search"
                      placeholder="Search products"
                      className="colors duration-100 ease-in-out text-gray-600 py-2 pr-4 pl-10 block w-full appearance-none leading-normal border border-transparent rounded-lg focus:outline-none text-left select-none truncate focus:bg-white focus:border-gray-300 bg-gray-200"/>
                  </form>
                </div>
              </div>
              <div className="hidden lg:flex lg:items-center lg:justify-between xl:w-1/4 px-6">
                <div className="relative mr-4">
                  <div className="flex justify-start items-center text-white">
                    { authenticated ? <a href="#" onClick={e => onClick()}>Logout</a> : <a href="#" onClick={e => onClick()}>Sign in</a>  }

                    <a className="block flex items-center hover:text-gray-700 mr-5" href="">
                      {/* Cart icon */}
                    </a>
                    <a className="block flex items-center hover:text-gray-700 mr-5" href="">
                      {/* Account info */}
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default SearchBar