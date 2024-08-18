import { router } from '@kit.ArkUI'
import { WeChat_CurrentUserKey } from '../../constant/Index'
import { MessageInfo, MessageInfoModel } from '../../models/Message'
import { UserInfo, UserInfoModel } from '../../models/User'
import { getRequestMessage } from '../../utils/Request'
import BottomInput from './Componts/BottomInput'
import Message from './Componts/Messgae'

@Entry
@Component
struct ChatDetail {
@StorageProp(WeChat_CurrentUserKey)
currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)//我
  @Provide
   talkUser:UserInfoModel = new UserInfoModel({} as UserInfo)//你
  @State
  messList:MessageInfoModel[]=[]
  @State
  talkUserInputIng: boolean = false //对方正在输入
  aboutToAppear(): void {
  //获取和我对话的用户信息
    this.getTalkUser()
  }
  getTalkUser(){
  this.talkUser = router.getParams() as UserInfoModel
  }
  sendTextMessage(content:string){
  //发送文本消息
    //新建消息
   let mess =  new MessageInfoModel({
      messageContent:content,
      sendUser:this.currentUser,//我发的消息
      connectUser:this.talkUser//我和小趴菜的聊天记录
    } as MessageInfo)
    this.messList.push(mess)//追加消息
    //发送消息到服务器，得到响应的内容
    setTimeout(()=>{
      this.getResponseMessage(content)
    },1000)

  }
  //获取对应消息
  async  getResponseMessage(content:string){
   this.talkUserInputIng = true
  const result = await getRequestMessage(content)
    //新建一个消息
   const mess = new MessageInfoModel({
      messageContent: result?.data?.info?.text,
      sendUser:this.talkUser,//回复的消息
      connectUser:this.talkUser//我和小趴菜的聊天记录
    } as MessageInfo)
    this.messList.push(mess)
    this.talkUserInputIng = false
  }
  build() {
    Column(){
      Stack({
        alignContent:Alignment.Start
      }){

        Text(this.talkUserInputIng ? "对方正在输入" : this.talkUser.username)
          .fontColor($r('app.color.text_primary'))
          .width("100%")
          .textAlign(TextAlign.Center)
        Image($r('app.media.ic_public_arrow_left'))
          .width(30)
          .height(30)
          .onClick(()=>{
            router.back()
          })
      }
      .width('100%')
      .padding({
        left:10,
        right:10
         })
      // Text(JSON.stringify(this.talkUser))

      List({space:20}){
        ForEach(this.messList,(item:MessageInfoModel)=>{
          ListItem(){
            Message({currentMessage:item})
          }
        })
      }
      .layoutWeight(1)
      .padding({
        top:10,
        bottom:10
      })
      .backgroundColor($r('app.color.back_color'))

      //底部内容
      BottomInput({
        sendTextMessage:(content:string)=>{
         this.sendTextMessage(content)
        }
      })
    }
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)

  }
}