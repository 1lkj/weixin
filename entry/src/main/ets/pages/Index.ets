import { Connent } from './connent'
import { Discover } from './discover'
import { tabbar } from './module/module'
import { My } from './my'
import { Wechat } from './wechat'

@Entry
@Component
struct Index {

  @State
  db:tabbar[]=[
    {
      name: 'wechat',
      wenzi: '微信',
      photo: $r('app.media.ic_public_message'),
      zp: $r('app.media.ic_public_message_filled')
    },
    {
      photo: $r('app.media.ic_public_contacts_group'),
      name: 'connect',
      wenzi: '联系人',
      zp: $r('app.media.ic_public_contacts_group_filled')
    },
    {
      photo: $r('app.media.ic_gallery_discover'),
      name: 'discover',
      wenzi: '发现',
      zp: $r('app.media.ic_gallery_discover_filled')
    },
    {
      photo: $r('app.media.ic_public_contacts'),
      name: 'my',
      wenzi: '我的',
      zp: $r('app.media.ic_public_contacts_filled')
    }
  ]
  @State
  current:number=0


  @Builder
  CusCommtent(item:tabbar,) {
    Column() {
      Image(this.db[this.current].wenzi === item.wenzi ? item.zp : item.photo)
        .width(30)
        .height(30)
      Text(item.wenzi)
        .fontSize(10)
        .fontColor(this.db[this.current].wenzi === item.wenzi ? $r("app.color.primary"):$r("app.color.text_primary"))
    }
  }

  build() {
    Column() {

      Tabs({index:$$this.current}){
        ForEach(this.db,(item:tabbar)=>{
          TabContent(){
            if (item.name === 'wechat') {
              Wechat()
            }else if(item.name === 'connect'){
              Connent()
            }else if(item.name === 'discover'){
              Discover()
            }else if(item.name === 'my'){
              My()
            }
          }.tabBar(this.CusCommtent(item))
        })
      }
      .barPosition(BarPosition.End)
      .width("100%")
      .height("100%")
      .animationDuration(200)

    }
    .height('100%')
    .width('100%')
  }
}
