// 导入页面路由模块
import ToDoList from '../views/ToDoItem'

@Entry
@Preview
@Component
struct Index {
  // species: string = '';
  // @State message: string = 'Hello World a';
  // @State times: number = 0;
  //
  // randomName() {
  //   this.species = 'primates'
  // }
  @State isFlag: boolean = true
  @State todoList: string[] = [
    '学习鸿蒙',
    '起床晨练',
    '吃肯德基',
    '出去海边玩',
    '去兜风',
  ]


  build() {
    Column({space: 16}) {
      Text('待办事项')
        .fontSize('28fp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .margin({
          top: '24vp',
          bottom: '12vp'
        })
        .width('100%')

      ForEach(this.todoList, (listItem: string)=> {
        ToDoList({content: listItem})
      }, (item: string) => JSON.stringify(item))

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg'))
  }
}

