export interface Item {
  img: string
  name: string
  sellOut: string
  cost: string
}

export interface LocationResType {
  address_id: number
  user_id: number
  nickname: string
  mobile: string
  province: string
  city: string
  district: string
  info: string
  is_default: number // 0-不是默认
  lat: string
  lng: string
  tags: string
  created_at: string
  updated_at: string
}

export interface GoodsType {
  tags: string
  cate_id: number
  goods_id: number
  goods_name: string
  goods_name_style: string
  goods_number: number
  goods_img: string
  goods_imgs: string
  market_price: number
  shop_price: number
  is_delete: number
  is_best: number
  is_new: number
  is_hot: number
  is_sell: number
  created_at: string
  updated_at: string
  total_sell: number
  info: string
  choose_state: number
  latitude: number
  longitude: number
  goods_imgs2: string[]
}