import { router } from '@kit.ArkUI'
import { CartType, chooseCart, deleteCart, getCartList, updateCart } from '../api/CartApi'

// 购物车
@Entry
@Component
struct Cart {
  @State dataList: CartType[] = []
  @State visibleDelete: boolean = false
  @State sumCost: number = 0

  aboutToAppear(): void {
    getCartList().then((res: CartType[]) => {
      this.dataList = res
      this.checkEnableDelete()
      this.calcSumCost()
    })
  }

  checkEnableDelete() {
    this.dataList.forEach((item: CartType) => {
      if (item.choose_state == 1) {
        this.visibleDelete = true
      }
    })
  }

  calcSumCost() {
    this.sumCost = 0
    this.dataList.forEach((item: CartType) => {
      if (item.choose_state == 1) {
        this.sumCost += item.shop_price * item.goods_number
      }
    })
  }

  build() {
    Column() {
      // 标题
      Row() {
        Text('<').fontSize(30).onClick(() => {
          router.back()
        })
        Text('购物车').fontSize(20)
        Text('')
        if (this.visibleDelete) {
          Text('删除').fontSize(20).fontColor(Color.Red).position({ top: 24, right: 5 }).onClick(() => {
            this.dataList.forEach((item: CartType) => {
              if (item.choose_state == 1) {
                deleteCart(String(item.cart_id))
              }
            })
          })
        }
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      // 内容
      List() {
        ForEach(this.dataList, (item: CartType) => {
          ListItem() {
            Row() {
              // 复选框
              Checkbox().select(item.choose_state == 1).onChange((newState: boolean) => {
                if (newState) {
                  this.visibleDelete = true
                  chooseCart(String(item.goods_id), '1')
                  this.sumCost += item.shop_price * item.goods_number
                } else {
                  chooseCart(String(item.goods_id), '0')
                  this.checkEnableDelete()
                  this.sumCost -= item.shop_price * item.goods_number
                }
                // this.calcSumCost()
              })
              // 图片
              Image(item.goods_img2)
                .width(120)
                .margin({ left: 5, right: 5 })
              // 商品信息 垂直方向排列
              Column() {
                Text(item.goods_name)
                  .maxLines(3)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text('克数：500克').width('100%').margin({ top: 10, bottom: 10 })
                Row() {
                  Text(String(item.shop_price)).fontColor('#357bf5')
                  Counter() {
                    Text(String(item.goods_number))
                  }
                  .onInc(() => {
                    item.goods_number++
                    updateCart(item.goods_id, String(item.goods_number))
                  })
                  .onDec(() => {
                    item.goods_number--
                    if (item.goods_number < 0) {
                      item.goods_number = 0
                    }
                    updateCart(item.goods_id, String(item.goods_number))
                  })
                }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              }.layoutWeight(1).height(135).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Start)
            }.margin({ top: 10 }).padding({ left: 10, right: 10 })
          }
        })
      }.width('100%').layoutWeight(1)

      // 底部
      Row() {
        Row() {
          Checkbox()
          Text('全选').fontColor('#ccc')
        }

        Row() {
          Text('合计: ').fontSize(14).fontColor('#ccc')
          Text('￥' + this.sumCost + ' ').fontSize(14).fontColor('#000').margin({ left: 5, right: 5 })
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