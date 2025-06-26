import { CategoryType, GoodsType } from "../datasource/Type"
import { Request } from "../utils/Request"

export const getSecKillList = () => {
  return Request.get<GoodsType[]>('/goods/seckill')
}

export const getHotList = () => {
  return Request.get<GoodsType[]>('/goods/hot')
}

export const getGoodsList = async (payload: GetGoodsListPayload) => {
  const raw: string = await Request.getRaw('/goods/index', payload)
  const page: GetGoodsPageRes = JSON.parse(raw)
  return page
  // return Request.get<GoodsType[]>('/goods/index', payload)
}

export const getGoodsDetail = (goods_id: number) => {
  return Request.get<GoodsType>('/goods/detail', Object({
    goods_id
  }))
}

export const getCategoryList = (pid: number | undefined = undefined) => {
  return Request.get<CategoryType[]>('/category/index',!pid || Object({
    pid
  }))
}

export interface GetGoodsListPayload {
  pagenum: string
  pagesize: string
  goods_name: string
  cate_id: string
  total_sell: 'asc' | 'desc'
  shop_price: 'asc' | 'desc'
}

export interface GetGoodsPageRes {
  state: string
  msg: string
  total: number
  list: GoodsType[]
}

