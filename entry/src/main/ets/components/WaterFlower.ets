import { WaterFlowDataSource } from '../datasource/WaterFlowDataSource';
import { LengthMetrics } from '@kit.ArkUI';
import { GoodsType } from '../datasource/Type';
import { addCart } from '../api/CartApi';

enum FooterState {
  Loading = 0,
  End = 1
}

@Component
export struct WaterFlower {
  @State footerState: FooterState = FooterState.Loading;
  @State isRefreshing: boolean = false;
  @Prop dataSource: WaterFlowDataSource

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
    // 产品瀑布流 滚动容器
    Refresh({ refreshing: $$this.isRefreshing }) {
      WaterFlow({ footer: this.itemFoot() }) {
        LazyForEach(this.dataSource, (item: GoodsType) => {
          FlowItem() {
            Column() { // 特性1-垂直排列，特性2-交叉居中
              if (item.is_hot == 1) {
                Text('HOT')
                  .backgroundColor(Color.Red)
                  .fontColor(Color.White)
                  .fontSize(12)
                  .fontWeight(600)
                  .padding({
                    left: 5,
                    right: 5,
                    top: 3,
                    bottom: 3
                  })
                  .zIndex(1)
                  .borderRadius(5)
                  .position({ right: 6, top: 3 })
              }

              if (item.is_best == 1) {
                Text('秒杀')
                  .backgroundColor(Color.Red)
                  .fontColor(Color.White)
                  .fontSize(12)
                  .fontWeight(600)
                  .padding({
                    left: 5,
                    right: 5,
                    top: 3,
                    bottom: 3
                  })
                  .zIndex(1)
                  .borderRadius(5)
                  .position({ right: 6, top: 3 })
              }

              Image(item.goods_img).width('95%').borderRadius(5)
              Text(item.goods_name).width('100%').margin({ top: 5 })
              Text("已销售" + item.goods_number + "件").width('100%').fontColor('#ccc')
              Row() {
                Text('￥' + String(item.market_price)).fontColor('#487aee')
                Image($r('app.media.shop')).width(20).onClick(() => {
                  addCart(item.goods_id, '1')
                })
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            }.width('100%').backgroundColor(Color.White).borderRadius(5).padding(5)
          }.width('100%').borderRadius({ topLeft: 5, topRight: 5 })
        }, (item: string) => item)
      }
      .onReachEnd(() => {
        console.info("onReachEnd")
        if (this.dataSource.totalCount() >= this.dataSource.totalCount()) {
          this.footerState = FooterState.End;
          return;
        }
        // setTimeout(() => {
        //   for (let i = 0; i < 10; i++) {
        //     this.dataSource.addLastItem();
        //   }
        // }, 1000)
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
  }
}