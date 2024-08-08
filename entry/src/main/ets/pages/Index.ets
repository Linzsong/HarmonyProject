// 导入页面路由模块
import { DataModel } from '../viewmodel/DataModel'
import ToDoList from '../views/ToDoItem'


@CustomDialog
@Component
struct CustomDialogTest {
  @Link textValue: string
  @Link inputValue: string
  controller?: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
  cancel: () => void = () => { }
  confirm: () => void = () => { }

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.textValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            if (this.controller != undefined) {
              this.controller.close()
              this.cancel()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            if (this.controller != undefined) {
              this.inputValue = this.textValue
              this.controller.close()
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }.borderRadius(10)

  }
}


@Entry
@Preview
@Component
struct Index {
  @State isFlag: boolean = true
  @State textValue: string = ''
  @State inputValue: string = ''
  @State todoList: string[] = []
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogTest({
      textValue: this.textValue,
      inputValue: this.inputValue,
      cancel: () => {
        this.onCancel()
      },
      confirm: () => {
        this.onAccept()
      },
    }),
    cancel: this.exitApp,
    autoCancel: true,
    onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    },
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked', this.inputValue)
    if(this.inputValue) {
      this.todoList.push(this.inputValue)
    }
  }

  exitApp() {
    console.info('Click the callback in the blank area')
  }

  aboutToAppear() {
    this.todoList = DataModel.todoList
  }

  build() {
    Column({ space: 16 }) {
      Text('待办事项')
        .fontSize('28fp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .margin({
          top: '24vp',
          bottom: '12vp'
        })
        .width('100%')


      ForEach(this.todoList, (listItem: string) => {
        ToDoList({ content: listItem })
      }, (item: string) => JSON.stringify(item))

      Button('添加事项')
        .width('80%')
        .fontColor($r('app.color.bg'))
        .fontSize('20fp')
        .height('50vp')
        .margin({ top: '10vp' })
        .onClick(() => {
          this.isFlag = !this.isFlag
          if (this.dialogController != null) {
            this.textValue = ''
            this.dialogController.open()
          }
        })


    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg'))
  }
}



