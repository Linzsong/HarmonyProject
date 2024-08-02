import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { MockKit, MockSetup, when } from '@ohos/hamock';

// 导入页面路由模块
@Entry
@Preview
@Component
struct Index {
  species: string = '';
  @State message: string = 'Hello World a';
  @State times: number = 0;

  // @MockSetup
  // randomName() {
  //   let mocker: MockKit = new MockKit();
  //   let mockfunc: Object = mocker.mockFunc(this, this.method1);
  //   // mock 指定的方法在指定入参的返回值
  //   when(mockfunc)('test').afterReturn(1);
  // }

  @MockSetup
  randomName() {
    this.species = 'primates aaaa'
  }


  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Text($r('app.string.myText'))
        .fontColor($r('app.color.custom_bg'))
        .fontSize(30)
        .margin({ left: 30, top: 100 })

      Row() {
        Button(`第${this.times}次点击`, { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(130)
          .height(40)
          .margin(30)
          .onClick(() => {
            this.times++
            // 业务场景调用方法
            console.log(this.species ); // in previewer, result = 1
            // console.info(`Succeeded in clicking the 'Next' button.`)
            // // 跳转到第二页
            // router.pushUrl({ url: 'pages/Second' }).then(() => {
            //   console.info('Succeeded in jumping to the second page.')
            //
            // }).catch((err: BusinessError) => {
            //   console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
            // })
          })


        // .type(ButtonType.Capsule)
      }

      Image($r('sys.media.ohos_app_icon'))
        .margin({ left: 30, top: 200 })
        .backgroundColor($r('sys.color.ohos_id_color_palette_aux1'))
    }
    .height('50%')
    .width('100%')
  }
}

@Preview
@Component
struct Index2 {
  @State message: string = 'Hello World 222';
  @State times: number = 0;

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Text($r('app.string.myText'))
        .fontColor($r('app.color.custom_bg'))
        .fontSize(30)
        .margin({ left: 30, top: 100 })

      Row() {
        Button(`第${this.times}次点击`, { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(130)
          .height(40)
          .margin(30)
          .onClick(() => {
            this.times++
            console.info(`Succeeded in clicking the 'Next' button.`)
            // 跳转到第二页
            router.pushUrl({ url: 'pages/Second' }).then(() => {
              console.info('Succeeded in jumping to the second page.')

            }).catch((err: BusinessError) => {
              console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
            })
          })


        // .type(ButtonType.Capsule)
      }

      Image($r('sys.media.ohos_app_icon'))
        .margin({ left: 30, top: 200 })
        .backgroundColor($r('sys.color.ohos_id_color_palette_aux1'))
    }
    .height('50%')
    .width('100%')
  }
}