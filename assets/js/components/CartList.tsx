import React from 'react'
import cart from '../services/cart'
import CartItemSummary from './CartItemSummary'

const CartItemList = (data) => {

  const cartItems = data.data.map((item) => {
    return (
      <CartItemSummary
        key={item.id}
        product={item.product} />
    )
  })

  return (
    <>
      {cartItems}
    </>
  )
}

export default CartItemList