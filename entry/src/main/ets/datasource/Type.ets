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