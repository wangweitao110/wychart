import { MessageInfo, MessageInfoModel } from '../../../models/Message'
import { UserInfoModel ,UserInfo} from '../../../models/User'
import {WeChat_CurrentUserKey} from '../../../constant'

@Preview
@Component
struct Message {
  //我是谁
  @StorageProp(WeChat_CurrentUserKey)
  currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)//我
  //当前消息的内容
  @Require
  @Prop
  currentMessage:MessageInfoModel = new MessageInfoModel({} as MessageInfo)


  @State
  isOwnMessage : boolean = this.currentUser.user_id === this.currentMessage?.sendUser?.user_id
  build() {
     Row(){
       Image(this.currentMessage.sendUser.avatar)
         .width(40)
         .aspectRatio(1)
         .borderRadius(4)
       Row(){
         Text(this.currentMessage.messageContent)
           .backgroundColor(this.isOwnMessage ? $r('app.color.second_primary'): $r('app.color.white'))
           .fontColor($r('app.color.text_primary'))
           .padding(10)
           .margin({
             left:10,
             right:10
           })
           .borderRadius(4)
       }
       .justifyContent(this.isOwnMessage ? FlexAlign.End:FlexAlign.Start)
       .layoutWeight(6)
       Text()
         .layoutWeight(1)
     }
     .padding({
       left:20,
       right:20
     })
    .direction(this.isOwnMessage ? Direction.Rtl:Direction.Ltr)
  }
}
export default Message