import { TabBar } from '../components/TabBar'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Profile {
  @State username: string = '未登录'
  @State avatar: string | Resource | undefined = $r('app.media.profile_avatar')

  onPageShow(): void {
    const nickname: string | undefined = AppStorage.get('nickname')
    if (nickname) { // 已登录
      this.username = nickname
      this.avatar = AppStorage.get('avatar')

    }
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Column() {
            Text('个人中心').fontSize(25).fontColor(Color.White)
              .fontWeight(700).margin({ top: 10, bottom: 30 })
            Image(this.avatar)
              .width(80).borderRadius(100)
            Text(this.username).fontColor(Color.White).margin({ top: 10 })

          }.width('100%').height(200).backgroundColor('#357bf5').onClick(() => {
            router.pushUrl({
              url: 'pages/Login'
            })
          })

          Column() {
            Column() {
              Text('我的订单').fontWeight(900).width('100%').margin({ bottom: 10 })
              Row() {
                Column() {
                  Image($r('app.media.shop')).width(20)
                  Text('购物车').margin({ top: 5 }).fontSize(14)
                }.layoutWeight(1).onClick(() => {
                  router.pushUrl({
                    url: "pages/Cart"
                  })
                })

                Column() {
                  Image($r('app.media.g1')).width(20)
                  Text('待付款').margin({ top: 5 }).fontSize(14)
                }.layoutWeight(1).onClick(() => {
                  router.pushUrl({
                    url: "pages/Order"
                  })
                })

                Column() {
                  Image($r('app.media.g2')).width(20)
                  Text('待发货').margin({ top: 5 }).fontSize(14)
                }.layoutWeight(1)

                Column() {
                  Image($r('app.media.g3')).width(20)
                  Text('待收货 ').margin({ top: 5 }).fontSize(14)
                }.layoutWeight(1)
              }
            }.padding(10).backgroundColor(Color.White).margin({ top: 20, bottom: 20 })

            Row() {
              Image($r('app.media.g5')).width(15)
              Text('个人资料').margin({ left: 10 })
            }.width('100%').backgroundColor(Color.White).padding(15).onClick(() => {
              router.pushUrl({
                url: 'pages/Personal'
              })
            })

            Row() {
              Image($r('app.media.g6')).width(15)
              Text('订单管理').margin({ left: 10 })
            }.width('100%').backgroundColor(Color.White).padding(15).onClick(() => {
              router.pushUrl({
                url: "pages/Order"
              })
            })

            Row() {
              Image($r('app.media.g7')).width(15)
              Text('地址管理').margin({ left: 10 })
            }.width('100%').backgroundColor(Color.White).padding(15).onClick(() => {
              router.pushUrl({
                url: 'pages/Location'
              })
            })

            Row() {
              Image($r('app.media.g8')).width(15)
              Text('积分排行').margin({ left: 10 })
            }.width('100%').backgroundColor(Color.White).padding(15)

            Row() {
              Image($r('app.media.g9')).width(15)
              Text('阿里通义千问客服').margin({ left: 10 })
            }.width('100%').backgroundColor(Color.White).padding(15).onClick(() => {
              router.pushUrl({
                url: 'pages/Ai'
              })
            })
          }.width('100%')

          Row().height(60).backgroundColor(Color.Transparent)
        }

      }.layoutWeight(1).align(Alignment.Top).scrollBar(BarState.Off)


      TabBar({ currentPage: 3 })
    }.width('100%').height('100%').backgroundColor('#f6f6f6')

  }
}
