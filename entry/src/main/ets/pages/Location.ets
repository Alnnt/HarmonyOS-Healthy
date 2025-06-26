import { router } from '@kit.ArkUI'
import { LocationResType } from '../datasource/Type';
import { Request } from '../utils/Request';

@Entry
@Component
struct Location {
  @State data: LocationResType[] = []

  onPageShow(): void {
    Request.get<LocationResType[]>('/address/index').then((res: LocationResType[]) => {
      this.data = res
    })
  }

  build() {
    Column() {
      Row() {
        Row() {
          Text('<').fontSize(30).onClick(() => {
            router.back()
          })
          Text('收货地址').fontSize(20).margin({ left: 5 })
        }

        Text('新增地址').fontColor(Color.Orange)
      }.width('100%').height(60).backgroundColor(Color.White).justifyContent(FlexAlign.SpaceBetween)

      Scroll() {
        Column() {
          ForEach(this.data, (item: LocationResType) => {
            ChildItem({ item })
          })
        }
      }.scrollBar(BarState.Off)

    }
  }
}

@Component
struct ChildItem {
  @Prop item: LocationResType

  build() {
    Row({ space: 10 }) {
      Column() {
        // 省 市 区
        Text(`${this.item.province}  ${this.item.city}  ${this.item.district}`)
          .fontColor(Color.Gray).fontSize(12)

        // 详细地址
        Text(this.item.info).fontWeight(600).fontSize(18)
          .padding({ top: 10, bottom: 8 })

        // 收货人
        Row() {
          Text(`${this.item.nickname}  ${this.item.mobile}`)
          if (this.item.is_default == 0) {
            Text('默认')
              .backgroundColor('#feefea')
              .fontColor('#ee6816')
              .borderRadius(5)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .margin({ left: 5 })
          }
        }
      }.alignItems(HorizontalAlign.Start)

      Image($r('app.media.ic_public_edit'))
        .width(20).backgroundImageSize(ImageSize.Cover)
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 10,
      right: 10,
      top: 15,
      bottom: 15
    })
  }
}