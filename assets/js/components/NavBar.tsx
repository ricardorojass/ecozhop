import React from 'react'
import { useHistory } from 'react-router-dom'

const NavBar = () => {
  const history = useHistory()

  function redirectTo(page: string) {
    history.push(`/${page}`)
  }

  return (
    <nav id="nav-bar">
      <div className="bg-gray-800">
        <div className="flex justify-center items-center text-white h-12 px-6">
          <a className="ml-3" href="#" onClick={e => redirectTo('home')}>Home</a>
          <a className="ml-3" href="#">Company</a>
          <a className="ml-3" href="#">Blog</a>
        </div>

      </div>
    </nav>
  )
}

export default NavBar