import { TabBar } from '../components/TabBar'
import { WaterFlower } from '../components/WaterFlower';
import { SeckillGoodsDataSource } from '../datasource/SeckillGoodsDataSource';
import { HotGoodsDataSource } from '../datasource/HotGoodsDataSource';
import { CommonModifier } from '@kit.ArkUI';
import { CategoryType, GoodsType } from '../datasource/Type';
import { getCategoryList, getGoodsList, GetGoodsListPayload, GetGoodsPageRes } from '../api/GoodsApi';
import { WaterFlowDataSource } from '../datasource/WaterFlowDataSource';


@Entry
@Component
struct ProjectWaterFlow {
  @State tabBarCategory: CategoryType[] = []
  @State secKillGoodsDataSource: SeckillGoodsDataSource = new SeckillGoodsDataSource()
  @State hotGoodsDataSource: HotGoodsDataSource = new HotGoodsDataSource()
  @State tabBarModifier: CommonModifier = new CommonModifier();
  @State sideBarShow: boolean = false
  @State getGoodsForm: GetGoodsListPayload = {
    pagenum: '1',
    pagesize: '10',
    goods_name: '',
    cate_id: '',
    total_sell: 'asc',
    shop_price: 'asc'
  }

  aboutToAppear(): void {
    this.tabBarModifier.align(Alignment.Start);
    getCategoryList().then((res: CategoryType[]) => {
      console.log(JSON.stringify(res))
      this.tabBarCategory = res
    })
  }

  getCategoryDataSource(category: CategoryType): WaterFlowDataSource {
    return new WaterFlowDataSource(async (): Promise<GoodsType[]> => {
      const payload: GetGoodsListPayload = JSON.parse(JSON.stringify(this.getGoodsForm))
      payload.cate_id = String(category.cat_id)
      payload.cate_id = '11'
      const page: GetGoodsPageRes = await getGoodsList(payload);
      return page.list;
    })
  }

  build() {
    Column() {
      // 导航栏 NavBar
      Row() {
        Image($r("app.media.cate")).width(30).margin({ left: 5 })
        Search({ value: $$this.getGoodsForm.goods_name, placeholder: "输入搜索商品的名称" })
          .layoutWeight(1)
          .backgroundColor("#FFF")
          .margin({ left: 10, right: 10 })
        Text("搜索").fontColor("#FFF").margin({ right: 5 })
      }.width('100%').height(60).backgroundColor('#487aee')

      if (this.sideBarShow) {
        Column() {
          List() {
            // ForEach()
          }
        }
        .backgroundColor(Color.Black)
        .width(120)
        .height(650)
        .position({ top: 0, left: 0 })
        .zIndex(1)
      }

      Tabs({ barPosition: BarPosition.Start, barModifier: this.tabBarModifier }) {
        TabContent() {
          WaterFlower({ dataSource: this.secKillGoodsDataSource })
        }.tabBar('秒杀')

        TabContent() {
          WaterFlower({ dataSource: this.hotGoodsDataSource })
        }.tabBar('热门')

        ForEach(this.tabBarCategory, (item: CategoryType) => {
          TabContent() {
            WaterFlower({ dataSource: this.getCategoryDataSource(item) })
          }.tabBar(item.cat_name)
        })
      }
      .barMode(BarMode.Scrollable)
      .width('100%')
      .layoutWeight(1)
      .barHeight(40)

      // 底部栏 TabBar
      TabBar({ currentPage: 2 })
    }
  }
}