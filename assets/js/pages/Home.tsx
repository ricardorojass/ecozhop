
import React from 'react';
import { Redirect } from 'react-router-dom'
import Loading from '../components/Loading'
import { useFetchData } from '../hooks'
import { Product } from '../types'
import ProductList from '../components/ProductList'
import productsService from '../services/products'

export default () => {

  const [{ loading, error, data }, setState] = useFetchData<Product[]>(async () => {
    return await productsService.list()
  })

  function onClick(product) {
    console.log('redirect to product detail');
  }

  if (loading) return <Loading />

  return (
    <>
      <ProductList data={data} onClick={(product) => onClick(product)}/>
    </>
  );
}