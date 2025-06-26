import { GoodsType } from "../datasource/Type"
import { Request } from "../utils/Request"

export const getSecKillList = () => {
  return Request.get<GoodsType[]>('/goods/seckill')
}

export const getHotList = () => {
  return Request.get<GoodsType[]>('/goods/hot')
}

export const getGoodsList = () => {
  return Request.get<GoodsType[]>('/goods/index')
}

export const getGoodsDetail = (goods_id: number) => {
  return Request.get<GoodsType>('/goods/detail', Object({
    goods_id
  }))
}

export interface GetGoodsListDTO {}