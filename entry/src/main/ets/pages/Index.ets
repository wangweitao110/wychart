import { TabBarClass } from '../models/Tab'
import Connect from './Connect/Connect'

@Entry
@Component
struct Index {
  //需要循环一个列表
  @State
  tabList:TabBarClass[] = [
    {
      icon:$r('app.media.ic_public_message'),
      name:'wechat',
      title:'微信',
      selectIcon:$r('app.media.ic_public_message_filled')

    },
    {
      icon:$r('app.media.ic_public_contacts_group'),
      name:'connect',
      title:'联系人',
      selectIcon:$r('app.media.ic_public_contacts_group_filled')

    },
    {
      icon:$r('app.media.ic_gallery_discover'),
      name:'discover',
      title:'发现',
      selectIcon:$r('app.media.ic_gallery_discover_filled')

    },
    {
      icon:$r('app.media.ic_public_contacts'),
      name:'my',
      title:'我的',
      selectIcon:$r('app.media.ic_public_contacts_filled')

    }
  ]

  @State
  currentIndex: number = 0//激活索引

 @Builder
 CommonTabBar(item:TabBarClass){
  Column(){
    Image(item.name === this.tabList[this.currentIndex].name ? item.selectIcon : item.icon)
      .width(20)
      .height(20)
    Text(item.title)
      .fontSize(12)
      .fontColor(item.name === this.tabList[this.currentIndex].name ? $r('app.color.primary') : $r('app.color.text_primary'))
      .margin({
        top:4
      })
  }
 }
  build() {
   Tabs({ index:$$this.currentIndex }){
    ForEach(this.tabList,(item:TabBarClass)=>{
      TabContent(){
        if(item.name==='connect'){
          Connect()
        }else {
          Text(item.title)
        }

      }
      .tabBar(this.CommonTabBar(item))
    })
   }
   .animationDuration(100)
   .barPosition(BarPosition.End)
  }
}