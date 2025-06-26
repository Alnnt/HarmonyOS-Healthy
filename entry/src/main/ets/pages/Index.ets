import { User } from '../api/UserApi';
import { TabBar } from '../components/TabBar';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = '';
  @State todos: string[] = []
  @State flag: boolean = false;
  @StorageProp('user') user: User = Object()

  aboutToAppear(): void {
    if (!this.user.nickname) {
      router.pushUrl({
        url: 'pages/Login'
      })
    }
  }

  build() {
    Column() {
      Stack() {
        Image($r("app.media.ic_home_bg")).width("100%").height(300)
        Text("健康生活").fontSize(30).offset({ left: 30, top: 20 })
        Text("目标进度").fontSize(14).offset({ left: 30, top: 120 })
        Text("50%").fontSize(50).fontWeight(600).offset({ left: 30, top: 140 })
      }.alignContent(Alignment.TopStart)

      Column() {
        Row() {
          Text("<").fontColor("#ccc").fontSize(18)
          Text("2025年6月16日 星期一").fontSize(12)
          Text(">").fontColor("#ccc").fontSize(18)
        }.padding({ top: 20 })

        Row() {
          Column() {
            Text("一").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_all_done")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("二").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_all_done")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("三").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_all_done")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("四").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_half_done")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("五").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_undone")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("六").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_undone")).width(20).margin({ top: 10 })
          }

          Column() {
            Text("日").fontColor("#ccc").fontSize(12)
            Image($r("app.media.ic_home_undone")).width(20).margin({ top: 10 })
          }
        }.justifyContent(FlexAlign.SpaceBetween).width("90%").height(30)

      }
      .width("95%")
      .height(110)
      .backgroundColor(Color.White)
      .borderRadius(20)
      .margin({ top: -90 });

      Stack() {
        List() {
          ListItem() {
            Row() {
              Text("任务列表")
            }.width("90%").justifyContent(FlexAlign.Start).margin({ top: 20 })
          }

          ListItem() {
            Row() {
              Row() {
                Image($r("app.media.water")).width(25).margin({ right: 10 })
                Text("喝水")
              }

              Row() {
                Text("已完成")
              }

            }
            .width("90%")
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ left: 20, right: 10 })
            .margin({ top: 10 })
          }

          ListItem() {
            Row() {
              Row() {
                Image($r("app.media.smile")).width(25).margin({ right: 10 })
                Text("每日微笑")
              }

              Row() {
                Text("已完成")
              }

            }
            .width("90%")
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ left: 20, right: 10 })
            .margin({ top: 10 })
          }

          ListItem() {
            Row() {
              Row() {
                Image($r("app.media.brush")).width(25).margin({ right: 10 })
                Text("每日刷牙")
              }

              Row() {
                Text("--/1次").fontColor("#CCC")
              }

            }
            .width("90%")
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ left: 20, right: 10 })
            .margin({ top: 10 })
          }

          ListItem() {
            Row() {
              Row() {
                Image($r("app.media.night")).width(25).margin({ right: 10 })
                Text("早睡")
              }

              Row() {
                Text("--/2次").fontColor("#CCC")
              }

            }
            .width("90%")
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ left: 20, right: 10 })
            .margin({ top: 10 })
          }

          ForEach(this.todos, (item: string) => {
            ListItem() {
              Row() {
                Row() {
                  Image($r("app.media.night")).width(25).margin({ right: 10 })
                  Text(item)
                }

                Row() {
                  Text("--/2次").fontColor("#CCC")
                }

              }
              .width(320)
              .height(60)
              .backgroundColor(Color.White)
              .borderRadius(10)
              .justifyContent(FlexAlign.SpaceBetween)
              .padding({ left: 20, right: 10 })
              .margin({ top: 10 })
            }
          })

          ListItem() {

          }.height(20)
        }.width("100%").alignListItem(ListItemAlign.Center)

        Image($r("app.media.ic_home_add")).width(35).offset({ x: -20, y: -40 }).onClick(() => {
          this.flag = true; //点击时候出现添加框
        })
        Column() {
          TextInput({ placeholder: "请输入待办任务", text: $$this.message }).backgroundColor(Color.White)
          Button("添加")
            .margin({ top: 10, bottom: 10 })
            .onClick(() => {
              this.todos.push(this.message)
              this.message = ""
              this.flag = false;
            })
        }
        .width("80%")
        .height(105)
        .zIndex(5)
        .offset({ left: -40, top: -50 })
        .padding(10)
        .backgroundColor("#ccc")
        .borderRadius(10)
        .visibility(this.flag ? Visibility.Visible : Visibility.None)
      }.alignContent(Alignment.BottomEnd).layoutWeight(1)


      TabBar({ currentPage: 0 })

    }.width("100%").height("100%").backgroundColor("#f1f2f5")
    .justifyContent(FlexAlign.SpaceBetween)

  }
}