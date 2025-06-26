import { router } from '@kit.ArkUI'
import { User } from '../api/UserApi'

// import { photoAccessHelper } from '@kit.MediaLibraryKit';
// import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ProfilePage {
  @StorageProp('user') user: User = Object()

  uploadAvatar() {
    // let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
    // PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    // PhotoSelectOptions.maxSelectNumber = 1;
    // let photoPicker = new photoAccessHelper.PhotoViewPicker();
    // photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
    //   console.info('PhotoViewPicker.select successfully, PhotoSelectResult uri: ' + JSON.stringify(PhotoSelectResult));
    // }).catch((err: BusinessError) => {
    //   console.error(`PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
    // });
  }

  build() {
    Column() {
      Text('<').fontSize(25).position({ top: 5, left: 5 }).zIndex(1)
        .onClick(() => {
          router.back()
        })

      // 封面区域
      Column() {
        Image('https://tse4-mm.cn.bing.net/th/id/OIP-C.0FQSOvu3OYJFe-h_sZKA6wHaNK?rs=1&pid=ImgDetMain')
          .width('100%')
          .height('100%')
          .backgroundImageSize(ImageSize.Cover)
          .objectFit(ImageFit.Cover)

        Button('更换封面')
          .fontSize(12)
          .width(80)
          .height(30)
          .backgroundColor('#66000000')
          .fontColor(Color.White)
          .position({ bottom: 15, right: 8 })
      }
      .width('100%')
      .height(220)
      .alignItems(HorizontalAlign.End)

      // 头像和完成度
      Row() {
        Row() {
          Image(this.user.avatar ? this.user.avatar : $r('app.media.per1'))
            .width(100)
            .height(100)
            .borderRadius(50)
            .border({ width: 2, color: Color.White })
            .offset({ y: -30 })
            .onClick(() => {
              this.uploadAvatar()
            })
          // .position({ x: '36%', y: -35 })
        }
        .width("100%")
        .height(50)
        .justifyContent(FlexAlign.Center)
        .borderRadius({ topLeft: 30, topRight: 30 })

        // .backgroundColor(Color.Black)


        // Column() {
        //   Text('资料完成度 80%')
        //     .fontSize(14)
        //
        //   Progress({ value: 80, total: 100, style: ProgressStyle.Linear })
        //     .width(150)
        //     .height(6)
        //     .color('#007DFF')
        // }
        // .margin({ left: 20 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .borderRadius({ topLeft: 10, topRight: 10 })
      .offset({ top: -10 })
      .backgroundColor('#fff')


      // .backgroundColor(Color.Red)

      // 个人信息列表
      List() {
        ListItem() {
          Row() {
            Text('名字')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text(this.user.nickname)
              .fontSize(16)
              .fontColor('#333333')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
        }.onClick(() => {
          router.pushUrl({
            url: 'pages/personal/Name',
            // params: {
            //   value:
            // }
          })
        })

        ListItem() {
          Row() {
            Text('简介')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('真的好喜欢远方与空……')
              .fontSize(16)
              .fontColor('#333333')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
        }

        ListItem() {
          Row() {
            Text('性别')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('不展示')
              .fontSize(16)
              .fontColor('#333333')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
        }

        ListItem() {
          Row() {
            Text('生日')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('2003-11-30')
              .fontSize(16)
              .fontColor('#333333')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
        }

        ListItem() {
          Row() {
            Text('所在地')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('填写地区，发现同乡')
              .fontSize(16)
              .fontColor('#666666')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')

        }

        ListItem() {
          Row() {
            Text('学校')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('填写学校，发现校友')
              .fontSize(16)
              .fontColor('#666666')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')

        }

        ListItem() {
          Row() {
            Text('健康号')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Text('58887726261')
              .fontSize(16)
              .fontColor('#333333')
              .layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')

        }

        ListItem() {
          Row() {
            Text('挂件中心')
              .fontSize(16)
              .fontColor('#333333')
              .width(90)

            Row() {
              Text('管理头像挂件 ')
                .fontSize(16)
                .fontColor('#333333')

              Image($r('app.media.g2'))
                .width(16)
                .height(16)

            }.layoutWeight(1)

            Image($r('app.media.right'))// 右侧箭头图标
              .width(20)
              .height(20)
          }
          .width('100%')
          .padding({
            top: 12,
            bottom: 12,
            left: 16,
            right: 16
          })
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
        }
      }
      .width('100%')
      .layoutWeight(1)
      .divider({
        strokeWidth: 0.5,
        color: '#F0F0F0',
        startMargin: 10,
        endMargin: 10
      })
    }
    .width('100%')
    // .backgroundColor('#F5F5F5') // 背景色
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)

  }
}

// 个人信息项组件
@Component
struct ProfileItem {
  private title: string = '';
  private content: string = '';
  private editable: boolean = false;
  private withArrow: boolean = false;

  build() {
    Row() {
      Text(this.title)
        .fontSize(16)
        .width(80)
        .textAlign(TextAlign.Start)

      Text(this.content)
        .fontSize(16)
        .layoutWeight(1)
        .textAlign(TextAlign.End)
        .fontColor(this.editable ? '#999999' : '#333333')

      if (this.withArrow) {
        Image($r('app.media.g1'))
          .width(16)
          .height(16)
          .margin({ left: 5 })
      }
    }
    .width('100%')
    .height(50)
    .padding(10)
    .backgroundColor(Color.White)
  }
}