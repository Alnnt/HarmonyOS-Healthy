import { router } from '@kit.ArkUI'

@Entry
@Component
struct Ai {
  build() {
    Column() { // 1 垂直排列、 2 水平居中
      // 导航栏 和谁聊天
      Row() {
        Text('<').onClick(() => {
          router.back()
        })
        Text('阿里通义千问客服')
        Text('')
      }.width('90%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      // 导航栏 和谁聊天 end
      // 聊天内容
      List() {
        ListItem() {
          Row() {
            Text('大模型')
              .width(50)
              .height(50)
              .borderRadius(25)
              .backgroundColor('#357bf5')
              .margin({ right: 10 })
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
            Text('Hi，我是医生大模型，有什么能够帮您？')
              .layoutWeight(1)
              .padding({
                left: 10,
                right: 10,
                top: 5,
                bottom: 5
              })
          }.width('100%').justifyContent(FlexAlign.Start).margin({ top: 10 })
        }

        ListItem() {
          Row() {
            Text('我肚子痛，肿么呢？')
              .layoutWeight(1)
              .padding({
                left: 10,
                right: 10,
                top: 5,
                bottom: 5
              })
            Text('赵四')
              .width(50)
              .height(50)
              .borderRadius(25)
              .backgroundColor('#357bf5')
              .margin({ left: 10 })
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }.width('100%').justifyContent(FlexAlign.End).margin({ top: 10 })
        }

        ListItem() {
          Row() {
            Text('感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服感觉不舒服')
              .layoutWeight(1)
              .padding({
                left: 10,
                right: 10,
                top: 5,
                bottom: 5
              })
            Text('赵四')
              .width(50)
              .height(50)
              .borderRadius(25)
              .backgroundColor('#357bf5')
              .margin({ left: 10 })
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }.width('100%').justifyContent(FlexAlign.End).margin({ top: 10 })
        }
      }.width('94%').layoutWeight(1)

      // 聊天内容 end
      // 输入框
      Row() {
        Image($r('app.media.voice1')).width(30)
        TextInput({ placeholder: '请输入聊天内容' }).borderRadius(0)
          .layoutWeight(1).margin({ right: 5 })
        Text('发送').fontColor(Color.White)
          .backgroundColor('#357bf5')
          .padding({
            left: 10,
            right: 10,
            top: 5,
            bottom: 5
          })
      }.width('100%').height(50).backgroundColor(Color.White)

      // 输入框 end
    }
  }
}