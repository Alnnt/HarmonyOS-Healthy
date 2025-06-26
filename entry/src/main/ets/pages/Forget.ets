// ForgotPasswordPage.ets
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ForgotPasswordPage {
  @State phone: string = '';
  @State verificationCode: string = '';
  @State newPassword: string = '';
  @State confirmPassword: string = '';
  @State countdown: number = 0;
  @State errorMessage: string = '';
  @State isNewPasswordVisible: boolean = false;
  @State isConfirmPasswordVisible: boolean = false;
  @State currentStep: number = 1; // 1:验证身份 2:设置新密码

  // 发送验证码
  sendVerificationCode() {
    if (!this.phone) {
      this.errorMessage = '请输入手机号码';
      return;
    }

    if (!/^1[3-9]\d{9}$/.test(this.phone)) {
      this.errorMessage = '手机号码格式不正确';
      return;
    }

    // 模拟发送验证码
    this.countdown = 60;
    let timer = setInterval(() => {
      this.countdown--;
      if (this.countdown <= 0) {
        clearInterval(timer);
      }
    }, 1000);

    this.errorMessage = '';
    promptAction.showToast({ message: '验证码已发送', duration: 2000 });
  }

  // 验证验证码
  verifyCode() {
    if (!this.verificationCode) {
      this.errorMessage = '请输入验证码';
      return;
    }

    // 模拟验证成功
    if (this.verificationCode === '123456') {
      this.currentStep = 2;
      this.errorMessage = '';
    } else {
      this.errorMessage = '验证码错误';
    }
  }

  // 重置密码
  resetPassword() {
    if (!this.newPassword) {
      this.errorMessage = '请输入新密码';
      return;
    }

    if (this.newPassword.length < 6) {
      this.errorMessage = '密码长度不能少于6位';
      return;
    }

    if (this.newPassword !== this.confirmPassword) {
      this.errorMessage = '两次输入的密码不一致';
      return;
    }

    // 模拟密码重置成功
    promptAction.showToast({ message: '密码重置成功', duration: 2000 });

    // 返回登录页面
    setTimeout(() => {
      router.replace({ url: 'pages/LoginPage' });
    }, 2000);
  }

  build() {
    Column() {
      //图片
      Image($r('app.media.login')).width('100%')
      // 标题
      Text('忘记密码')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 30 })

      // 步骤指示器
      Row() {
        Text('1.验证身份')
          .fontSize(16)
          .fontColor(this.currentStep === 1 ? '#007DFF' : '#999999')

        Text(' > ')
          .fontSize(16)
          .margin({ left: 10, right: 10 })

        Text('2.设置新密码')
          .fontSize(16)
          .fontColor(this.currentStep === 2 ? '#007DFF' : '#999999')
      }
      .margin({ bottom: 30 })

      // 错误提示
      if (this.errorMessage) {
        Text(this.errorMessage)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ bottom: 10 })
      }

      if (this.currentStep === 1) {
        // 第一步：验证身份
        Column() {
          // 手机号输入框
          Row(){
            Image($r('app.media.username')).width(20)
            TextInput({ placeholder: '请输入注册手机号' })
              .backgroundColor(Color.White)
              .onChange((value: string) => {
                this.phone = value;
                this.errorMessage = '';
              })
          }.width('80%')
          .border({ width:1, color:'#ccc' })
          .padding({left:10,right:10})
          .borderRadius(6)
          .margin({ bottom: 30 })

          // 验证码输入框
          Row() {
            Image($r('app.media.password')).width(20)
            TextInput({placeholder:'请输入验证码'})
              .layoutWeight(1)
              .backgroundColor(Color.White)
              .onChange((value: string) => {
                this.verificationCode = value;
                this.errorMessage = '';
              })
            Button(this.countdown > 0 ? `${this.countdown}s后重试` : '获取验证码')
              .width(100)
              .enabled(this.countdown === 0)
              .onClick(() => this.sendVerificationCode())
          }.width('80%')
          .border({ width:1, color:'#ccc' })
          .padding({left:10,right:5})
          .borderRadius(6)
          .margin({ bottom: 30 })

          // 下一步按钮
          Button('下一步')
            .width('90%')
            .height(40)
            .type(ButtonType.Capsule)
            .backgroundColor('#007DFF')
            .onClick(() => this.verifyCode())
        }
      } else {
        // 第二步：设置新密码
        Column() {
          // 新密码输入框
          Row() {
            Image($r('app.media.password')).width(20)
            TextInput({ placeholder: '请输入新密码' })
              .backgroundColor(Color.White)
              .width('100%')
              .type(this.isNewPasswordVisible ? InputType.Normal : InputType.Password)
              .onChange((value: string) => {
                this.newPassword = value;
                this.errorMessage = '';
              })
          }
          .width('80%')
          .border({ width:1, color:'#ccc' })
          .padding({left:10,right:10})
          .borderRadius(6)
          .margin({ bottom: 30 })

          // 确认密码输入框
          Row() {
            Image($r('app.media.password')).width(20)
            TextInput({ placeholder: '请再次输入新密码' })
              .backgroundColor(Color.White)
              .width('100%')
              .height(40)
              .type(this.isConfirmPasswordVisible ? InputType.Normal : InputType.Password)
              .onChange((value: string) => {
                this.confirmPassword = value;
                this.errorMessage = '';
              })
          }
          .width('80%')
          .border({ width:1, color:'#ccc' })
          .padding({left:10,right:10})
          .borderRadius(6)
          .margin({ bottom: 30 })

          // 完成按钮
          Button('完成')
            .width('90%')
            .height(40)
            .type(ButtonType.Capsule)
            .backgroundColor('#007DFF')
            .onClick(() => this.resetPassword())
        }
      }

      // 返回登录
      Row() {
        Text('想起密码了？')
          .fontSize(14)
        Text('返回登录')
          .fontSize(14)
          .fontColor('#007DFF')
          .onClick(() => {
            router.pushUrl({ url: 'pages/Login' });
          })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}