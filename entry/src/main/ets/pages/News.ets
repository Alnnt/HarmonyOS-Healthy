import { Article } from '../components/Article'
import { TabBar } from '../components/TabBar'

@Entry
@Component
struct News {
  @Builder
  TabBarBuilder(name: string) {
    Column() {
      Text(name)
      Image($r('app.media.icon')).width(30)
    }
  }

  build() {
    Column() {
      // 广告 Ad
      Image($r('app.media.banner')).width('80%')
      // 选项卡
      Tabs() {
        TabContent() {
          Column() {
            Article()
          }.width('100%').height('100%').backgroundColor('#f5f6f8')
        }.tabBar(this.TabBarBuilder('热门推荐'))

        TabContent() {
          Column() {
            Article()
          }.width('100%').height('100%').backgroundColor('#f5f6f8')
        }.tabBar(this.TabBarBuilder('养生课堂'))

        TabContent() {
          Column() {
            Article()
          }.width('100%').height('100%').backgroundColor('#f5f6f8')
        }.tabBar(this.TabBarBuilder('精彩专题'))

        TabContent() {
          Column() {

            Article()
          }.width('100%').height('100%').backgroundColor('#f5f6f8')
        }.tabBar(this.TabBarBuilder('专家讲堂'))
      }.width('100%').layoutWeight(1)

      // 选项卡 end
      // 底部栏
      TabBar({ currentPage: 1 })
      // 底部栏 end
    }
  }
}