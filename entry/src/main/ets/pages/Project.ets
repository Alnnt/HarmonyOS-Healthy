import { TabBar } from '../components/TabBar'
import { Item } from '../datasource/Type';
import { WaterFlowDataSource } from '../datasource/WaterFlowDataSource';
import { LengthMetrics } from '@kit.ArkUI';

enum FooterState {
  Loading = 0,
  End = 1
}

@Entry
@Component
struct ProjectWaterFlow {
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  @State footerState: FooterState = FooterState.Loading;
  @State isRefreshing: boolean = false;

  @Builder
  itemFoot() {
    // 不要直接用IfElse节点作为footer的根节点。
    Column() {
      if (this.footerState == FooterState.Loading) {
        Text(`加载中...`)
          .fontSize(12)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      } else if (this.footerState == FooterState.End) {
        Text(`到底啦...`)
          .fontSize(12)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      } else {
        Text(`Footer`)
          .fontSize(12)
          .width(50)
          .height(50)
          .align(Alignment.Center)
          .margin({ top: 2 })
      }
    }.width('100%')
  }

  build() {
    Column() {
      // 导航栏 NavBar
      Row() {
        Image($r("app.media.cate")).width(30)
        Search({ placeholder: "输入搜索商品的名称" }).layoutWeight(1).backgroundColor("#FFF")
          .margin({ left: 10, right: 10 })
        Text("搜索").fontColor("#FFF")
      }.width('100%').height(60).backgroundColor('#487aee')

      // 产品瀑布流 滚动容器
      Refresh({ refreshing: $$this.isRefreshing }) {
        WaterFlow({ footer: this.itemFoot() }) {
          LazyForEach(this.dataSource, (item: Item) => {
            FlowItem() {
              Column() { // 特性1-垂直排列，特性2-交叉居中
                Image(item.img).width('80%')
                Text(item.name).width('100%')
                Text("已销售" + item.sellOut + "件").width('100%').fontColor('#ccc')
                Row() {
                  Text(item.cost).fontColor('#487aee')
                  Image($r('app.media.shop')).width(20)
                }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              }.width('100%').backgroundColor(Color.White).borderRadius(5).padding(5)
            }.width('100%')
          }, (item: string) => item)
        }
        .onReachEnd(() => {
          console.info("onReachEnd")
          if (this.dataSource.totalCount() > 100) {
            this.footerState = FooterState.End;
            return;
          }
          setTimeout(() => {
            for (let i = 0; i < 10; i++) {
              this.dataSource.addLastItem();
            }
          }, 1000)
        })
        .width('100%')
        .height('100%')
        .layoutWeight(1)
        .backgroundColor('#f1f5f8')
        .columnsTemplate('1fr 1fr')
        .columnsGap(20)
        .rowsGap(20)
        .padding({
          top: 20,
          bottom: 20,
          left: 10,
          right: 10
        })
        .fadingEdge(true, { fadingEdgeLength: LengthMetrics.vp(20) })
      }
      .onStateChange((refreshStatus: RefreshStatus) => {
        // 下拉刷新数据
        if (refreshStatus === RefreshStatus.Done) {
          this.dataSource.refreshItems()
          console.log("refreshed")
        }
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false
        }, 1000)
      }).layoutWeight(1)


      // 底部栏 TabBar
      TabBar({ currentPage: 2 })
    }
  }
}