import { getHotList } from "../api/GoodsApi";
import { WaterFlowDataSource } from "./WaterFlowDataSource";

export class HotGoodsDataSource extends WaterFlowDataSource {
  constructor() {
    super(getHotList)
  }
}