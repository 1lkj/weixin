import { UserInfo } from "./module"
import { util } from "@kit.ArkTS"

export enum MessageTypeEnum{
  TEXT,//文本消息
  IMAGE,//图片消息
  AUDIO,//音频消息
  VIDEO,//视频消息
  LOCATION,//位置消息
  LINK,//链接消息
}

export interface MessageInfo{
  id:string//Id
  sendUser:UserInfo,//发送者
  sendTime:number,//发送时间
  sourceFilePath:string,//音频地址,视频地址,图片地址
  sourceDuration:number,//音频时长,视频时长
  messageType:MessageTypeEnum,//消息类型 0:文本,1:图片,2:视频,3:音频
  messageContent:string,//消息是内容还是语音
  connentUser:UserInfo//接收者
}


export class MessageInfoModel implements MessageInfo{
  id:string=""
  sendUser:UserInfo={} as UserInfo
  sendTime:number=0
  sourceFilePath:string=""
  sourceDuration:number=0
  messageType:MessageTypeEnum=MessageTypeEnum.TEXT
  messageContent:string=""
  connentUser:UserInfo={} as UserInfo

  constructor(model:MessageInfo) {
    this.id=model.id || util.generateRandomUUID()
    this.sendUser=model.sendUser
    this.sendTime=model.sendTime || Date.now()
    this.sourceFilePath=model.sourceFilePath
    this.sourceDuration=model.sourceDuration
    this.messageType=model.messageType || MessageTypeEnum.TEXT
    this.messageContent=model.messageContent
    this.connentUser=model.connentUser
  }

}
