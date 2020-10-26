import React from 'react'
import { useFetchData } from '../hooks'
import Loading from '../components/Loading'
import CartList from '../components/CartList'
import { CartItem } from '../types'
import cartService from '../services/cart'

const Cart = () => {

  const [{ loading, error, data }, setState] = useFetchData<CartItem[]>(async () => {
    return await cartService.list()
  })

  if (loading) return <Loading />

  return(
    <div className="mx-auto px-4 pt-12 pb-12">
      <h1 className="text-2xl">Shopping Cart</h1>

      <div className="md:w-8/12 flex flex-col justify-between pt-4">
        <CartList data={data}/>

      </div>
      <div className="w-3/12 flex flex-col justify-center bg-gray-200 border p-4">
        <p className="pb-4">Subtotal (# item): <span>$134.000</span></p>
        <button className="bg-yellow-500 py-2 px-4">Proceed to checkout</button>
      </div>
    </div>
  )
}

export default Cart