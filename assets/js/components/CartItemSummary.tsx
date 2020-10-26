import React from 'react'
import { Product } from '../types'

const CartItemSummary = (product) => {
  const item = product.product

  return (
    <div className="flex border p-4 mb-4">
      <div className="flex items-center">
        <input id="product" name="product" type="checkbox"/>
      </div>
      <div className="ml-4 mr-4">
        <img className="hover:grow hover:shadow-lg" src="https://images.unsplash.com/photo-1555982105-d25af4182e4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100&h=100&q=80" />
      </div>
      <div className="flex justify-between">
        <span className="flex-auto bg-gray-400 px-4 py-2 m-2">{item.name}</span>
        <span className="flex-auto bg-gray-400 px-4 py-2 m-2">
          <label htmlFor="quantity">Qty: </label>
          <select className="relative" name="quantity" id="quantity">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
          </select>
        </span>
        <span className="flex-auto bg-gray-400 px-4 py-2 m-2">${item.price}</span>
      </div>
    </div>
  )
}

export default CartItemSummary