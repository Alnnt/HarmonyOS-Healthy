import { getHotList } from "../api/GoodsApi";
import { GoodsType } from "./Type";
import { WaterFlowDataSource } from "./WaterFlowDataSource";

export class HotGoodsDataSource extends WaterFlowDataSource {
  constructor() {
    super();
    getHotList().then((res: GoodsType[]) => {
      this.dataArray = res
      console.log(JSON.stringify(res))
    })
  }
}