import Router from "@system.router"
import { router } from "@kit.ArkUI"
import { UserInfo } from "../module/module"

@Entry
@Component
struct ChatDetail {

  @State
  talker:UserInfo={} as UserInfo

  aboutToAppear(): void {
    this.talker=router.getParams() as UserInfo
  }

  build() {
    Column() {
      Row(){
        Stack({alignContent:Alignment.Start}){
          Text(this.talker.username)
            .width("100%")
            .fontSize(20)
            .fontColor(Color.Blue)
            .textAlign(TextAlign.Center)
          Image($r("app.media.ic_public_arrow_left"))
            .width(40)
            .height(40)
            .onClick(()=>{
              router.back()
            })
        }
      }
      .height(50)




    }
    .width("100%")
    .height("100%%")
  }
}

export default ChatDetail;