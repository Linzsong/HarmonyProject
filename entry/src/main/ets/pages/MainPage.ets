import CommonConstants from '../common/constants/CommonConstants';

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

    }
  }
}