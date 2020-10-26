import axios from '../axios'
import { CartItem } from '../types'

async function list(): Promise<CartItem[]> {
  const response = await axios.get('/cart')
  return response.data.data
}

export default {
  list,
}