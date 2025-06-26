import { getSecKillList } from "../api/GoodsApi";
import { WaterFlowDataSource } from "./WaterFlowDataSource";

export class SeckillGoodsDataSource extends WaterFlowDataSource {
  constructor() {
    super(getSecKillList)
  }
}