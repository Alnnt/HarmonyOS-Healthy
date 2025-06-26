import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { smsRegistry, smsSend } from '../api/UserApi';

@Entry
@Component
struct Register {
  @State phone: string = '';
  @State verificationCode: string = '';
  @State Password: string = '';
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
      promptAction.showToast({
        message: '请输入手机号码', // 弹窗提示
        duration: 2000  // 显示2秒
      });
      return;
    }

    if (!/^1[3-9]\d{9}$/.test(this.phone)) {
      this.errorMessage = '手机号码格式不正确';
      promptAction.showToast({
        message: '手机号码格式不正确', // 弹窗提示
        duration: 2000
      });
      return;
    }
    if (!this.Password) {
      this.errorMessage = '请设置密码';
      promptAction.showToast({
        message: '密码不能为空', // 弹窗提示
        duration: 2000
      });
      return;
    }

    if (this.Password.length < 6) {
      this.errorMessage = '密码长度不能少于6位';
      promptAction.showToast({
        message: '密码长度不能少于6位', // 弹窗提示
        duration: 2000
      });
      return;
    }

    if (this.Password !== this.confirmPassword) {
      this.errorMessage = '两次输入的密码不一致';
      promptAction.showToast({
        message: '两次输入的密码不一致', // 弹窗提示
        duration: 2000
      });
      return;
    }
    // 模拟发送验证码
    smsSend(this.phone, 'registry')
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
    smsRegistry(this.phone, this.verificationCode).then(() => {
      router.back()
    })

    // if (!this.verificationCode) {
    //   this.errorMessage = '请输入验证码';
    //   promptAction.showToast({
    //     message: '请输入验证码', // 弹窗提示
    //     duration: 4000
    //   });
    //   return;
    // }
    //
    // // 模拟验证成功
    // if (this.verificationCode != '123456') {
    //   this.errorMessage = '验证码错误';
    //   promptAction.showToast({
    //     message: '验证码错误', // 弹窗提示
    //     duration: 4000
    //   });
    //   return;
    // }
    //
    //
    // // 返回登录页面
    // setTimeout(() => {
    //   router.back();
    // }, 2000);
  }

  /*
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

      // 返回登录页面
      setTimeout(() => {
        router.replace({ url: 'pages/LoginPage' });
      }, 2000);
    }*/


  build() {
    Column({ space: 30 }) { // 特性1-垂直排列、特性2-交叉居中\
      Image($r('app.media.img')).width('100%').position({ x: 0, y: 0 }).height('100%')
      Row() {
        Image("https://images.icon-icons.com/1206/PNG/96/1491254395-returnbackredoarrow_82934.png")
          .width(40)
          .height(10)
          .position({ x: 10, y: 20 })
        Image("https://gd-hbimg.huaban.com/aaf0985e7fce782a035cde90848ac3651154e8f820344-s4uoJ9_fw658webp")
          .width(100)
          .height(100)
          .position({ x: 230, y: 0 })
      }
      .onClick(() => {
        router.back()
      })
      .margin({ top: 50 })
      .width('100%')
      .height(100)
      .justifyContent(FlexAlign.SpaceBetween)

      // 标题
      Text('用户注册')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30 })

      Row() {
        Image($r('app.media.username')).width(20)
        TextInput({ placeholder: '请输入手机号' })
          .backgroundColor(Color.White)
          .layoutWeight(1)
          .onChange((value: string) => {
            this.phone = value;
            this.errorMessage = '';
          })
      }
      .width('75%')
      .backgroundColor(Color.White)
      .padding({ left: 15, right: 10 })
      .borderRadius(50)


      Row() {
        Image($r('app.media.password')).width(20)
        TextInput({ placeholder: '请输入新密码' })
          .backgroundColor(Color.White)
          .layoutWeight(1)
          .type(this.isNewPasswordVisible ? InputType.Normal : InputType.Password)
          .onChange((value: string) => {
            this.Password = value;
            this.errorMessage = '';
          })
      }
      .width('75%')
      .backgroundColor(Color.White)
      .padding({ left: 15, right: 10 })
      .borderRadius(50)

      // 确认密码输入框
      Row() {
        Image($r('app.media.password')).width(20)
        TextInput({ placeholder: '请再次输入新密码' })
          .backgroundColor(Color.White)
          .layoutWeight(1)
          .height(40)
          .type(this.isConfirmPasswordVisible ? InputType.Normal : InputType.Password)
          .onChange((value: string) => {
            this.confirmPassword = value;
            this.errorMessage = '';
          })
      }
      .width('75%')
      .backgroundColor(Color.White)
      .padding({ left: 15, right: 10 })
      .borderRadius(50)


      Row() {
        Image($r('app.media.password')).width(20)
        TextInput({ placeholder: '请输入验证码' })
          .layoutWeight(1)
          .height(40)
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            this.verificationCode = value;
            this.errorMessage = '';
          })
        Button(this.countdown > 0 ? `${this.countdown}s后重试` : '获取验证码')
          .width(100)
          .enabled(this.countdown === 0)
          .onClick(() => this.sendVerificationCode())
          .backgroundColor('#124556')
      }
      .width('75%')
      .backgroundColor(Color.White)
      .padding({ left: 15 })
      .borderRadius(50)
      .margin({ bottom: 30 })

      // 下一步按钮
      Button('立即注册')
        .width('80%')
        .height(40)
        .type(ButtonType.Capsule)
        .backgroundColor('#124556')/*if (this.resetPassword){

        }*/
        .onClick(() => this.verifyCode())
    }
  }
}
