import { promptAction } from "@kit.ArkUI";

@Entry
@Component
export struct BootomInput {

  //判断是否能切换
  @State
  qie:boolean=false;

  //保存的是输入框的内容
  @State
  content:string="";
  //发送文本的方法
  @State
  sendTextMessage : (content:string)=>void=()=>{}


  build() {
    Column() {
      Row() {
        Image(this.qie?$r("app.media.ic_public_keyboard"):$r("app.media.ic_public_sound"))
          .width(25)
          .height(25)
          .onClick(()=>{
            this.qie=!this.qie;
          })

        if (this.qie){
          Button("按住说话",{
            type :ButtonType.Normal,
          })
            .backgroundColor(Color.White)
            .layoutWeight(1)
            .borderRadius(2)
            .fontColor($r("app.color.text_primary"))
        }else {
          TextInput({text:$$this.content})
            .layoutWeight(1)
            .height(35)
            .borderRadius(2)
            .backgroundColor($r("app.color.white"))
            .onSubmit(()=>{
              if (this.content) {
                // //输入的消息,给父组件,父组件将输入的数据放到messageList里面
                // this.sendTextMessage(this.content)
                // //发送完之后消息行就为空了
                // this.content="";
                AlertDialog.show({
                  message:"发送成功"
                })
              }else{
                promptAction.showToast({
                  message:"内容不能为空"
                })
              }
            })
        }
        Image($r("app.media.ic_public_add_norm"))
          .width(25)
          .height(25)
      }
      .padding({
        left: 10,
        right: 10,
      })
    }
    .width("100%")
    .backgroundColor($r("app.color.second_back_color"))
  }
}

export default BootomInput;