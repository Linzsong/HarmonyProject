import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import StyleConstants from '../common/utils/StyleConstants';
import HomePage from '../view/HomePage';
import MinePage from '../view/MinePage';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;

  build() {
    Tabs({
      barPosition: this.currentDeviceSize === CommonConstants.LG ?
      BarPosition.Start : BarPosition.End,
      index: this.currentIndex
    }) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX,
        $r('app.media.ic_home_selected'), $r('app.media.ic_home_normal')))

      TabContent() {
        MinePage()
      }
      .tabBar(this.TabBuilder(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX,
        $r('app.media.ic_mine_selected'), $r('app.media.ic_mine_normal')))

    }
    .barWidth(this.currentDeviceSize === CommonConstants.LG ?
    StyleConstants.BAR_WIDTH_LG : StyleConstants.FULL_PARENT)
    .barHeight(this.currentDeviceSize === CommonConstants.LG ?
    StyleConstants.BAR_HEIGHT_LG : StyleConstants.BAR_DEFAULT_HEIGHT)
    .vertical(this.currentDeviceSize === CommonConstants.LG)
    .backgroundColor(Color.White)
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .onChange((index: number) => {
      this.currentIndex = index;
      Logger.info(CommonConstants.TAG_MAIN_PAGE, 'onChange index ' + JSON.stringify(index));
    })
  }

  @Builder
  TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width($r('app.float.base_tab_size'))
        .height($r('app.float.base_tab_size'))
      Text(title)
        .margin({ top: $r('app.float.base_tab_top') })
        .fontSize($r("app.float.tab_font_size"))
        .fontColor(this.currentIndex === index ? $r('app.color.main_page_selected') : $r('app.color.main_page_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height(StyleConstants.FULL_PARENT)
    .width(StyleConstants.FULL_PARENT)
  }
}