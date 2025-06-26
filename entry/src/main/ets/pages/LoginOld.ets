import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 30 }) {
      Image($r('app.media.login')).width('100%')

      Row() {
        Image($r('app.media.username')).width(20)
        TextInput({ placeholder: '请输入手机号 ' }).backgroundColor(Color.Transparent)
      }.width('80%').border({
        width: 1,
        radius: 6,
        color: Color.Gray
      }).padding({ left: 10, right: 10 })

      Row() {
        Image($r('app.media.username')).width(20)
        TextInput({ placeholder: '请输入验证码' }).layoutWeight(1)
          .backgroundColor(Color.Transparent)
        Button('发送短信').backgroundColor(Color.Transparent).fontColor(Color.Blue)
      }.width('80%').border({
        width: 1,
        radius: 6,
        color: Color.Gray
      }).padding({ left: 10 })

      Button('立即登录').width('80%').backgroundColor('#2ab98d').borderRadius(10).onClick(() => {
        router.pushUrl({ url: 'pages/Index' })
      })
      Row() {
        Row() {
          Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
          Text('记住密码')
        }

        Text('忘记密码')
      }.justifyContent(FlexAlign.SpaceBetween).width('80%')

    }
  }
}