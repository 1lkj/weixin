import { router } from "@kit.ArkUI"
import { UserInfo } from "../module/module"
import BootomInput from "./BootomInput"
import message from "./message"
import { MessageInfo, MessageInfoModel } from "../module/Messageinfo"
import {currentUser } from "../module/user"

@Entry
@Component
struct ChatDetail {

  //传过来的聊天用户名称
  @State
  talker:UserInfo={} as UserInfo

  //把父组件的名称拿过来
  aboutToAppear(): void {
    this.talker=router.getParams() as UserInfo
  }

  //聊天记录数据表
  @State
  messageList:MessageInfoModel[]=[
    new MessageInfoModel({
      id:"1",// 标识
      sendUser :currentUser,//这条消息的发送者
      sendTime:1729666240777,//发送时时间
      sourceFilePath:"",//音频地址 图片地址 视频地址
      sourceDuration:0,//音频或者视频的长度单位
      messageType:0,//0表示发送的消息是一个文本
      messageContent:"hello,您好",
      connentUser:currentUser,//这条消息的接收者
    }),
    new MessageInfoModel({
      id:"2",// 标识
      sendUser : {
        username:"李佳豪",
        avater:$r("app.media.ic_public_message"),
        user_id:"li",
      },//这条消息的发送者
      sendTime:1729666240777,//发送时时间
      sourceFilePath:"",//音频地址 图片地址 视频地址
      sourceDuration:0,//音频或者视频的长度单位
      messageType:0,//0表示发送的消息是一个文本
      messageContent:"hello,您好",
      connentUser:currentUser,//这条消息的接收者
    }),
    new MessageInfoModel({
      id:"3",// 标识
      sendUser :currentUser,//这条消息的发送者
      sendTime:1729666240777,//发送时时间
      sourceFilePath:"",//音频地址 图片地址 视频地址
      sourceDuration:0,//音频或者视频的长度单位
      messageType:0,//0表示发送的消息是一个文本
      messageContent:"你个废人",
      connentUser:currentUser,//这条消息的接收者
    }),
    new MessageInfoModel({
      id:"4",// 标识
      sendUser : {
        username:"李佳豪",
        avater:$r("app.media.ic_public_message"),
        user_id:"li",
      },//这条消息的发送者
      sendTime:1729666240777,//发送时时间
      sourceFilePath:"",//音频地址 图片地址 视频地址
      sourceDuration:0,//音频或者视频的长度单位
      messageType:0,//0表示发送的消息是一个文本
      messageContent:"向阳而生",
      connentUser:currentUser,//这条消息的接收者
    }),
  ]

  //发送数据内容方法
  sendTextMessage(content:string){
    //把输入框输入的数据添加到messageList中
    let message=new MessageInfoModel({
      messageContent:content,
      sendUser:currentUser,
      connentUser:this.talker,
    }as MessageInfo)
    this.messageList.push(message)
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

      // //占据剩余空间
      // Blank()
      List({space:10}) {
        ForEach(this.messageList, (item:MessageInfoModel) => {
          ListItem() {
            message({
              AcurrentMessage:item,
            })
          }
        })
      }
      .padding({
        top:20,
      })
      .width("100%")
      .height("100%")
      .layoutWeight(1)
      .backgroundColor($r("app.color.back_color"))

      BootomInput({
        sendTextMessage:(content:string)=>{
          this.sendTextMessage
        }
      })

    }
    .width("100%")
    .height("100%")
  }
}

export default ChatDetail;
