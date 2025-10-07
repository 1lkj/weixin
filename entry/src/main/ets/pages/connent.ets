import { UserInfo } from "./module/module"
import { DefaultUserList } from "./module/user"
import { router } from "@kit.ArkUI"

@Entry
@Component
export struct Connent {

  @State
  filterList:UserInfo[]=[]

  //组件开始加载的时候
  aboutToAppear(): void {
    this.filterList = DefaultUserList
  }

  //监听输入框变化 并且查找功能实现
  @Watch("Filter")
  @State
  name:string=""

  //查找人员功能
  Filter(){
    this.filterList = DefaultUserList.filter((item:UserInfo)=>{
      return item.username.includes(this.name)
    })
  }

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
            .stateStyles({
              pressed:{
                .backgroundColor($r("app.color.back_color"))
              },
              normal:{
                .backgroundColor($r("app.color.white"))
              }
            })
          }
          .onClick(()=>{
            router.pushUrl({
              url:"pages/ChatDetail/ChatDetail",
              params:item
            })
          })
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}
