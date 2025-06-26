import { router } from '@kit.ArkUI'

// 订单列表（代付款）
@Entry
@Component
struct Order {
  build() {
    Column() {
      // 标题
      Row() {
        Text('<').fontSize(30).onClick(() => {
          router.back()
        })
        Text('订单列表').fontSize(20)
        Text('').fontSize(30)
      }.width('94%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      // 内容
      List() {
        ListItem() {
          Column() {
            Text('QF2025061909300810000') //订单号

          }.backgroundColor(Color.Red)
          .width('100%')
          .borderRadius(10)
        }

        // ListItem() {
        //   Row() {
        //     // 图片
        //     Image("https://p3.maiyaole.com/img/item/202001/08/380_20200108182001442.jpg")
        //       .width(120)
        //       .margin({ left: 5, right: 5 })
        //     // 商品信息 垂直方向排列
        //     Column() {
        //       Text('商品信息商品信息商品信息商品信息商品信息商品信息商品信息商品信息商息')
        //         .maxLines(3)
        //         .textOverflow({ overflow: TextOverflow.Ellipsis })
        //       Text('克数：500克').width('100%').margin({ top: 10, bottom: 10 })
        //       Row() {
        //         Text('198.33').fontColor('#357bf5')
        //         Text('支付状态').fontColor(Color.Red)
        //       }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        //     }
        //     .layoutWeight(1)
        //     .height(135)
        //     .alignItems(HorizontalAlign.Start)
        //     .justifyContent(FlexAlign.Start)
        //   }.margin({ top: 10 }).padding({ left: 10, right: 10 })
        // }

      }.width('100%').layoutWeight(1).backgroundColor('#f6f6f6')

    }
  }
}