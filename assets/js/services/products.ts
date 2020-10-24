import axios from '../axios'
import { Product } from '../types'

async function list(): Promise<Product[]> {
  const response = await axios.get('/admin/products')
  return response.data.data
}

export default {
  list,
}