import React from 'react';

import ProductSummary from './ProductSummary'

const ProductList = ({data, onClick}) => {

  const products = data.map((product) => {
    return (
      <ProductSummary
        key={product.id}
        product={product}
        onClick={onClick} />
    )
  })

  return (
    <>

      <section id="store">
        <div className="container mx-auto flex items-center flex-wrap pt-4 pb-12">
          {products}
        </div>


      </section>
    </>
  );

}

export default ProductList;