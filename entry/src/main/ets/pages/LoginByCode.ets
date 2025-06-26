import { router } from '@kit.ArkUI'
import { promptAction } from '@kit.ArkUI';
import { smsLogin, smsSend, User } from '../api/UserApi';

@Entry
@Component
struct Login {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State phone: string = '';
  @State verificationCode: string = '';
  @State agreeProtocol: boolean = false;
  @State countdown: number = 0;
  @State errorMessage: string = '';

  sendVerificationCode() {
    if (!this.phone) {
      this.errorMessage = '请输入手机号码';
      promptAction.showToast({ message: this.errorMessage, duration: 2000 });
      return;
    }

    if (!/^1[3-9]\d{9}$/.test(this.phone)) {
      this.errorMessage = '手机号码格式不正确';
      promptAction.showToast({ message: this.errorMessage, duration: 2000 });
      return;
    }

    smsSend(this.phone, 'login').then(() => {
      promptAction.showToast({ message: '验证码已发送', duration: 2000 });
    })
    this.countdown = 60;
    let timer = setInterval(() => {
      this.countdown--;
      if (this.countdown <= 0) {
        clearInterval(timer);
      }
    }, 1000);

    this.errorMessage = '';
  }

  build() {
    Column({ space: 30 }) {
      //图片
      Image($r('app.media.login')).width('100%')
      //输入框
      Row() {
        Image($r('app.media.username')).width(20)
        TextInput({ placeholder: '请输入手机号' }).backgroundColor(Color.White).onChange((val: string) => {
          this.phone = val
        })
      }.width('80%').border({ width: 1, color: '#ccc' }).padding({ left: 10, right: 10 }).borderRadius(6)

      //输入框
      Row() {
        Image($r('app.media.password')).width(20)
        TextInput({ placeholder: '请输入验证码' })
          .layoutWeight(1).backgroundColor(Color.White)
          .onChange((value: string) => {
            this.verificationCode = value;
          })
        Button(this.countdown > 0 ? `${this.countdown}s后重试` : '获取验证码')
          .width(100)
          .enabled(this.countdown === 0)
          .backgroundColor(Color.White)
          .fontColor(Color.Blue)
          .onClick(() => this.sendVerificationCode())
      }.width('80%').border({ width: 1, color: '#ccc' }).padding({ left: 10, right: 5 }).borderRadius(6)

      //按钮
      Button('立即登录')
        .width('80%')
        .backgroundColor('#2ab98d')
        .type(ButtonType.Normal)
        .borderRadius(10)
        .onClick(() => {
          smsLogin(this.phone, this.verificationCode).then((user: User) => {
            console.log(JSON.stringify(user))
            AppStorage.setOrCreate("nickname", user.nickname)
            AppStorage.setOrCreate("avatar", user.avatar)
            AppStorage.setOrCreate("mobile", user.mobile)
            AppStorage.setOrCreate("token", user.token)

            router.replaceUrl({ url: 'pages/Index' })
          })
        })
      //文本
      Row() {
        Text('密码登录')
          .fontSize(14)
          .fontColor('#999999')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({ url: 'pages/Login' })
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