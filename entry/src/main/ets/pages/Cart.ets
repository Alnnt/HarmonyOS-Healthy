import { router } from '@kit.ArkUI'

// 购物车
@Entry
@Component
struct Cart {
  build() {
    Column() {
      // 标题
      Row() {
        Text('<').fontSize(30).onClick(() => {
          router.back()
        })
        Text('购物车').fontSize(20)
        Text('').fontSize(30)
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      // 内容
      List() {

        ListItem() {
          Row() {
            // 复选框
            Checkbox()
            // 图片
            Image("https://p3.maiyaole.com/img/item/202001/08/380_20200108182001442.jpg")
              .width(120)
              .margin({ left: 5, right: 5 })
            // 商品信息 垂直方向排列
            Column() {
              Text('商品信息商品信息商品信息商品信息商品信息商品信息商品信息商品信息商息')
                .maxLines(3)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text('克数：500克').width('100%').margin({ top: 10, bottom: 10 })
              Row() {
                Text('198.33').fontColor('#357bf5')
                Counter() {
                  Text('66')
                }
                .onInc(() => {
                })
                .onDec(() => {
                })
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            }.layoutWeight(1).height(135).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Start)
          }.margin({ top: 10 }).padding({ left: 10, right: 10 })
        }

      }.width('100%').layoutWeight(1)

      // 底部
      Row() {
        Row() {
          Checkbox()
          Text('全选').fontColor('#ccc')
        }

        Row() {
          Text('合计: ').fontSize(14).fontColor('#ccc')
          Text('￥0 ').fontSize(14).fontColor('#000').margin({ left: 5, right: 5 })
          Text('支付')
            .fontSize(14)
            .fontColor('#fff')
            .backgroundColor('#357bf5')
            .padding({
              left: 10,
              right: 10,
              top: 5,
              bottom: 5
            })
        }
      }.width('90%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)
    }
  }
}