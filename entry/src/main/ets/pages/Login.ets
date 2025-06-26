import { router } from '@kit.ArkUI'
import { url } from '@kit.ArkTS'

@Entry
@Component

struct Login {
  build() {
    Column({space:30}) {
      //图片
      Image($r('app.media.login')).width('100%')
      //输入框
      Row() {
        Image($r('app.media.username')).width(20)
        TextInput({ placeholder: '请输入用户名/手机号' }).backgroundColor(Color.White)
      }.width('80%').border({ width:1, color:'#ccc' }).padding({left:10,right:10}).borderRadius(6)
      //输入框
      Row(){
        Image($r('app.media.password')).width(20)
        TextInput({placeholder:'请输入密码'}).layoutWeight(1).backgroundColor(Color.White)
      }.width('80%').border({ width:1, color:'#ccc' }).padding({left:10,right:10}).borderRadius(6)
      //按钮
      Button('立即登录').width('80%').backgroundColor('#2ab98d').type(ButtonType.Normal).borderRadius(10)
      //文本
      Row() {//默认水平
        Row() {
          Checkbox()
          Text('记住密码').fontColor('#ccc')
        }
        Text('忘记密码？').fontColor('#ccc').onClick(() => {
          router.pushUrl({url:'pages/Forget'})
        })
      }.width('80%').justifyContent(FlexAlign.SpaceBetween)
      Row(){
        Text('验证码登录')
          .fontSize(14)
          .fontColor('#999999')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({url:'pages/Logintwo'})
          })
      }.width('80%').justifyContent(FlexAlign.End)
      Row() {
        Text('还没有账号？')
          .fontSize(14)
        Text('立即注册')
          .fontSize(14)
          .fontColor('#007DFF')
          .onClick(() => {
            router.pushUrl({ url: 'pages/Register' });
          })
      }
    }
  }
}