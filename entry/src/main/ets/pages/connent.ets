import { UserInfo } from "./module/module"
import { DefaultUserList } from "./module/user"

@Entry
@Component
export struct Connent {

  @State
  filterList:UserInfo[]=[]

  //组件开始加载的时候
  aboutToAppear(): void {
    this.filterList = DefaultUserList
  }

  @State
  name:string=""

  build() {
    Column() {
      Row() {
        TextInput({ placeholder: "请输入姓名", text: $$this.name })
          .height(38)
          .borderRadius(20)
          .backgroundColor(Color.White)
          .padding(10)
      }
      .width("100%")
      .height("10%")
      .backgroundColor(Color.Transparent)

      List() {
        ForEach(this.filterList, (item:UserInfo) => {
          ListItem(){
            Row(){
              Image(item.avater)
                .width(20)
                .height(20)
              Column(){
                Text(item.username)
                  .fontSize(12)
                  .fontColor(Color.Black)
              }
              .justifyContent(FlexAlign.Start)
              .padding(10)
            }
            .width("100%")
            .padding(15)
          }
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}
