import { router } from '@kit.ArkUI'

@Entry
@Component
struct Welcome {
  @State second: number = 5
  @State timer: number = 0

  build() {
    Column() {
      Column() {
        Image($r('app.media.logo')).width(100).height(100)
        Text("健康生活").fontSize(18).fontWeight(600).margin({ top: 20 })
        Text("运动总有新玩法").fontSize(14).fontColor("#888").margin({ top: 10 })
      }.position({ x: '35%', y: '15%' }).zIndex(2)

      Image($r('app.media.splash_bg')).width('100%').height('100%')
      Row() {
        Text('跳过 ' + this.second.toString())
          .backgroundColor(Color.Black)
          .border({
            radius: 10
          })
          .fontColor(Color.White)
          .fontSize(12)
          .padding({
            left: 10,
            right: 10,
            top: 3,
            bottom: 3
          })
          .margin({ top: 5, right: 5 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Index'
            })
            clearInterval(this.timer)
          })
      }.width('100%').justifyContent(FlexAlign.End).position({ x: 0 })
    }
  }

  onPageShow(): void {
    const timeDecline = () => {
      this.second--
      if (this.second == 0) {
        router.pushUrl({
          url: 'pages/Index'
        })
      }
    }
    this.timer = setInterval(timeDecline, 1000)
  }
}