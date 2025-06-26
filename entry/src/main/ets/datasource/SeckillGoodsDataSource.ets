import { getSecKillList } from "../api/GoodsApi";
import { GoodsType } from "./Type";
import { WaterFlowDataSource } from "./WaterFlowDataSource";

export class SeckillGoodsDataSource extends WaterFlowDataSource {
  constructor() {
    super();
    getSecKillList().then((res: GoodsType[]) => {
      this.dataArray = res
      console.log(JSON.stringify(res))
    })
  }
}