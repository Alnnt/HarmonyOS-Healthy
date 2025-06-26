import { router } from '@kit.ArkUI'
import { changeNickName } from '../../api/PersonalApi'

@Entry
@Component
struct Name {
  @State value: string = ''
  @State saveEnable: boolean = false
  controller: TextInputController = new TextInputController();

  build() {
    Column() {
      Row() {
        Text('<').fontSize(30).onClick(() => {
          router.back()
        })
        Text('修改名字').fontSize(20)
        Text('保存')
          .fontSize(18)
          .margin({ right: 10 })
          .fontColor(this.saveEnable ? Color.Orange : Color.Gray)
          .onClick(() => {
            changeNickName(this.value).then(() => {
              router.back()
            })
          })
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Text('我的名字')
          .fontSize(15)
          .fontColor(Color.Gray)
          .margin({ top: 10, bottom: 10, left: 15 })
        TextInput({ text: this.value, placeholder: '填写名字', controller: this.controller })
          .width('100%')
          .fontSize(15)
          .backgroundColor(Color.White)
          .onEditChange(() => {
            this.saveEnable = true
          })
        Divider().color(Color.Gray).width('100%')
      }.width('100%').alignItems(HorizontalAlign.Start)

    }
  }
}