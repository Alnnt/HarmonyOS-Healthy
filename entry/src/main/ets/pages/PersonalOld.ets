import { router } from '@kit.ArkUI'

@Entry
@Component
struct Personal {
  @State name: string = '不吃香草（答辩版）'
  @State phone: string = '11451462935'

  build() {
    Column() {
      Row() {
        Text('<').fontSize(30).onClick(() => {
          router.back()
        })
        Text('个人资料').fontSize(20)
        Text('').fontSize(30)
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('头像')
        Row() {
          Image('https://picx.zhimg.com/80/v2-2842b4389682fadc260572a6b4f0e8be_720w.webp?source=1def8aca')
            .width(60)
            .height(60)
            .borderRadius(5)
          Text('>').margin({ left: 10 })
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left: 10,
        right: 10,
        top: 12,
        bottom: 12
      })
      .backgroundColor('#fff')
      .margin({ bottom: 2 })

      Row() {
        Text('名字')
        Row() {
          Text(this.name).fontColor(Color.Gray)
          Text('>').margin({ left: 10 })
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left: 10,
        right: 10,
        top: 15,
        bottom: 15
      })
      .backgroundColor('#fff')
      .margin({ bottom: 2 })

      Row() {
        Text('手机号')
        Row() {
          Text(this.phone).fontColor(Color.Gray)
          Text('>').margin({ left: 10 })
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left: 10,
        right: 10,
        top: 15,
        bottom: 15
      })
      .backgroundColor('#fff')
      .margin({ bottom: 2 })
    }.height('100%').backgroundColor("#f6f6f6").justifyContent(FlexAlign.Start)
  }
}