import { TabBar } from '../components/TabBar'
import { WaterFlower } from '../components/WaterFlower';
import { SeckillGoodsDataSource } from '../datasource/SeckillGoodsDataSource';
import { HotGoodsDataSource } from '../datasource/HotGoodsDataSource';


enum FooterState {
  Loading = 0,
  End = 1
}

@Entry
@Component
struct ProjectWaterFlow {
  @State secKillGoodsDataSource: SeckillGoodsDataSource = new SeckillGoodsDataSource()
  @State hotGoodsDataSource: HotGoodsDataSource = new HotGoodsDataSource()

  // @Builder
  // TabBarBuilder(name: string) {
  //   Column() {
  //     Text(name)
  //     Image($r('app.media.icon')).width(30)
  //   }.height(10)
  // }

  build() {
    Column() {
      // 导航栏 NavBar
      Row() {
        Image($r("app.media.cate")).width(30)
        Search({ placeholder: "输入搜索商品的名称" }).layoutWeight(1).backgroundColor("#FFF")
          .margin({ left: 10, right: 10 })
        Text("搜索").fontColor("#FFF")
      }.width('100%').height(60).backgroundColor('#487aee')

      Tabs({ barPosition: BarPosition.Start, index: 1 }) {
        TabContent() {
          // WaterFlower({ dataSource: this.secKillGoodsDataSource })
        }.tabBar('aaaa')

        TabContent() {
          WaterFlower({ dataSource: this.secKillGoodsDataSource })
        }.tabBar('秒杀')

        TabContent() {
          WaterFlower({ dataSource: this.hotGoodsDataSource })
        }.tabBar('热门')
      }
      .barMode(BarMode.Scrollable)
      .width('100%')
      .layoutWeight(1)


      // 底部栏 TabBar
      TabBar({ currentPage: 2 })
    }
  }
}