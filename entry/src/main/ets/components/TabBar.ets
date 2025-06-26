import { router } from "@kit.ArkUI"

@Component
export struct TabBar {
  @Prop currentPage: number

  build() {
    Row() {
      Column() {
        Image(this.currentPage === 0 ? $r('app.media.ic_tabs_home_sel')
          : $r('app.media.ic_tabs_home_normal'))
          .width(30).height(30)
        Text('首页').fontSize(14)
      }.layoutWeight(1).onClick(() => {
        if (this.currentPage !== 0) {
          router.replaceUrl({
            url: 'pages/Index'
          })
        }
      })

      Column() {
        Image(this.currentPage === 1 ? $r('app.media.ic_tabs_achievement_sel')
          : $r('app.media.ic_tabs_achievement_normal'))
          .width(30).height(30)
        Text('健康咨询').fontSize(14)
      }.layoutWeight(1).onClick(() => {
        if (this.currentPage !== 1) {
          router.replaceUrl({
            url: 'pages/News'
          })
        }
      })

      Column() {
        Image(this.currentPage === 2 ? $r('app.media.list_sel')
          : $r('app.media.list'))
          .width(30).height(30)
        Text('健康产品2').fontSize(14)
      }.layoutWeight(1).onClick(() => {
        if (this.currentPage !== 2) {
          router.replaceUrl({
            url: 'pages/Project'
          })
        }
      })

      Column() {
        Image(this.currentPage === 3 ? $r('app.media.ic_tabs_mine_sel')
          : $r('app.media.ic_tabs_mine_normal')).width(30).height(30)
        Text('我的').fontSize(14)
      }.layoutWeight(1).onClick(() => {
        if (this.currentPage !== 3) {
          router.replaceUrl({
            url: 'pages/Profile'
          })
        }
      })
    }.width('100%').height(60).backgroundColor(Color.White)
  }
}