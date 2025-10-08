import { MessageInfo, MessageInfoModel } from "../module/Messageinfo"
import { currentUser } from "../module/user"

@Component
struct message {

  @Prop
  AcurrentMessage:MessageInfoModel = new MessageInfoModel({} as MessageInfo)

  build() {
    Row() {
      Image(this.AcurrentMessage.sendUser.avater)
        .width(30)
        .height(30)
        .borderRadius(6)

      Row() {
        Column(){
          Text(this.AcurrentMessage.messageContent)
            .backgroundColor(currentUser.user_id===this.AcurrentMessage.sendUser.user_id?$r("app.color.text_primary"):Color.White)
            .fontSize(12)
            .fontColor(Color.Brown)
            .padding(10)
            .margin({
              left: 10,
              right: 10,
            })
            .borderRadius(5)
        }
      }
      .layoutWeight(6)
      .justifyContent(currentUser.user_id===this.AcurrentMessage.sendUser.user_id?FlexAlign.End:FlexAlign.Start)
      Text()
        .layoutWeight(1)
    }
    .padding({
      left:15,
      right:15,
    })
    .direction(currentUser.user_id===this.AcurrentMessage.sendUser.user_id?Direction.Rtl:Direction.Ltr)
    .alignItems(VerticalAlign.Top)
    .width('100%')
  }
}

export default message;

