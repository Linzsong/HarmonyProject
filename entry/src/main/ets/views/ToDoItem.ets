@Preview
@Component
export default struct ToDoList {
  private content?: string;
  @State isComplete: boolean = false;

  @Builder
  labelIcon(icon: Resource) {
    Image(icon).width('28vp').height('28vp').borderRadius('50%').margin('20vp')
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
        // Image($r('app.media.ic_ok')).width('28vp').height('28vp').borderRadius('50%').margin('20vp')
      } else {
        this.labelIcon($r('app.media.ic_default'))
        // Image($r('app.media.ic_default')).width('28vp').height('28vp').borderRadius('50%').margin('20vp')
      }

      Text(this.content)
        .fontSize('20fp')
        .opacity(this.isComplete ? 0.4 : 1)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .width('96%')
    .height('60vp')
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.start_window_background'))
    .borderRadius('10vp')
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}
