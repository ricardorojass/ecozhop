import React from 'react'

const ProductSummary = ({product, onClick}) => {

  return (
    <div className="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
      <a href="#" onClick={() => onClick(product)}>
        <img className="hover:grow hover:shadow-lg" src="https://images.unsplash.com/photo-1555982105-d25af4182e4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80" />
        <div className="pt-3 flex items-center justify-between">
          <p className="">{product.name}</p>
        </div>
        <p className="pt-1 text-gray-900">${product.price}</p>
      </a>
      <button className="bg-yellow-400 h-12">Add to Cart</button>
    </div>
  )
}

export default ProductSummary