
export interface Store {
  getState(): any
  setState(state: any): void
  subscribe(fn: Function): void
  unsubscribe(fn: Function): void
}

export interface User {
  id?: number
  name?: string
  email?: string
  password?: string
  token?: string
  loaded?: boolean
}

export interface Product {
  id?: number
  name?: string
  description?: string
  price?: number
  brand?: string
  rating?: number
  admin_id?: number
}

export interface CartItem {
  id?: number
  quantity?: number,
  product?: Product[]
}