import { Request } from "../utils/Request"

export const getCartList = () => {
  return Request.get<CartType[]>('/cart/index')
}

export const addCart = (goods_id: number, buyNum: string) => {
  return Request.post<void>('/cart/create', Object({
    goods_id,
    buyNum
  }))
}

export const chooseCart = (goods_id: string, choose_state: string) => {
  return Request.put<void>('/cart/choose', Object({
    goods_id,
    choose_state
  }))
}

export const updateCart = (goods_id: number, buyNum: string) => {
  return Request.put<void>('/cart/update', Object({
    goods_id,
    buyNum
  }))
}

export const deleteCart = (cart_id: string) => {
  return Request.delete<void>('/cart/delete', Object({
    cart_id
  }))
}

export interface CartType {
  cart_id: number
  user_id: number
  goods_id: number
  goods_name: string
  market_price: number
  shop_price: number
  goods_number: number
  goods_attr: string
  created_at: string
  updated_at: string
  choose_state: number
  goods_img2: string
}


// @Observed
// class CartType {
//   cart_id: number
//   user_id: number
//   goods_id: number
//   goods_name: string
//   market_price: number
//   shop_price: number
//   goods_number: number
//   goods_attr: string
//   created_at: string
//   updated_at: string
//   choose_state: number
//   goods_img2: string
//
//   constructor(cart_id: number,
//     user_id: number,
//     goods_id: number,
//     goods_name: string,
//     market_price: number,
//     shop_price: number,
//     goods_number: number,
//     goods_attr: string,
//     created_at: string,
//     updated_at: string,
//     choose_state: number,
//     goods_img2: string) {
//     this.cart_id = cart_id
//     this.user_id = user_id
//     this.goods_id = goods_id
//     this.goods_name = goods_name
//     this.market_price = market_price
//     this.shop_price = shop_price
//     this.goods_number = goods_number
//     this.goods_attr = goods_attr
//     this.created_at = created_at
//     this.updated_at = updated_at
//     this.choose_state = choose_state
//     this.goods_img2 = goods_img2
//   }
// }