import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import MultipleDevicesUtils from '../common/utils/MultipleDevicesUtils';
import StyleConstants from '../common/utils/StyleConstants';

// 导入页面路由模块
@Entry
@Preview
@Component
struct Index {
  species: string = '';
  @State message: string = 'Hello World a';
  @State times: number = 0;

  onPageShow() {
    console.log('onPageShow')
    MultipleDevicesUtils.register();
  }

  build() {
    GridRow({
      columns: {
        sm: StyleConstants.COLUMNS_SM,
        md: StyleConstants.COLUMNS_MD,
        lg: StyleConstants.COLUMNS_LG
      },
      gutter: {
        x: StyleConstants.GRID_GUTTER
      }
    }) {
      GridCol({
        span: {
          sm: StyleConstants.SPAN_SM,
          md: StyleConstants.SPAN_MD,
          lg: StyleConstants.SPAN_LG
        }, offset: {
          md: StyleConstants.OFFSET_MD,
          lg: StyleConstants.OFFSET_LG
        }
      }) {
        Column() {
          // Title component
          LoginTitle()
          // Bottom component
          LoginBottom()
        }

      }

    }
    .backgroundColor($r('app.color.background'))

  }
}

@Preview
@Component
struct LoginTitle {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .width('78vp')
        .height('78vp')
        .margin({ bottom: '8vp' })
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.common_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.more_text_color'))
        .margin({
          top: $r('app.float.more_margin_top'),
          bottom: $r('app.float.more_margin_bottom')
        })
    }
    .backgroundColor($r('app.color.background'))
    .justifyContent(FlexAlign.Center)
    .width(StyleConstants.FULL_PARENT)
    .height(StyleConstants.LOGIN_LOGO_HEIGHT)
    .align(Alignment.Center)

    // Text('apple')
    //   .fontColor($r('app.color.title_text_color'))
  }
}

@Preview
@Component
struct LoginBottom {
  @State account: string = '';
  @State password: string = '';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        // 设置子元素垂直方向间距为5
        Text('space').width('90%')
        Column({ space: 5 }) {
          Column().width('100%').height(30).backgroundColor('red')
          Column().width('100%').height(30).backgroundColor('black')
        }.width('90%').height(100).border({ width: 1 })

        // 设置子元素水平方向对齐方式
        Text('alignItems(Start)').width('90%')
        Column() {
          Column().width('50%').height(30).backgroundColor(0xAFEEEE)
          Column().width('50%').height(30).backgroundColor(0x00FFFF)
        }.alignItems(HorizontalAlign.Start).width('90%').border({ width: 1 })

        Text('alignItems(End)').width('90%')
        Column() {
          Column().width('50%').height(30).backgroundColor(0xAFEEEE)
          Column().width('50%').height(30).backgroundColor(0x00FFFF)
        }.alignItems(HorizontalAlign.End).width('90%').border({ width: 1 })

        Text('alignItems(Center)').width('90%')
        Column() {
          Column().width('50%').height(30).backgroundColor(0xAFEEEE)
          Column().width('50%').height(30).backgroundColor(0x00FFFF)
        }.alignItems(HorizontalAlign.Center).width('90%').border({ width: 1 })

        // 设置子元素垂直方向的对齐方式
        Text('justifyContent(Center)').width('90%')
        // Column() {
        //   Column().width('90%').height(30).backgroundColor(0xAFEEEE)
        //   Column().width('90%').height(30).backgroundColor(0x00FFFF)
        // }.height(100).border({ width: 1 }).justifyContent(FlexAlign.Center)

        Text('justifyContent(End)').width('90%')
        // Column() {
        //   Column().width('90%').height(30).backgroundColor(0xAFEEEE)
        //   Column().width('90%').height(30).backgroundColor(0x00FFFF)
        // }.height(100).border({ width: 1 }).justifyContent(FlexAlign.End)
      }.width('100%').padding({ top: 5 })
      .enabled(false)
      .backgroundImageSize(ImageSize.Auto)

    }.scrollBar(BarState.Auto)



  }
}