import { router } from '@kit.ArkUI'
import { WeChat_CurrentUserKey } from '../../constant/Index'
import { UserInfo, UserInfoModel } from '../../models/User'
import BottomInput from './Componts/BottomInput'

@Entry
@Component
struct ChatDetail {
@StorageProp(WeChat_CurrentUserKey)
currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)//我
  @Provide
   talkUser:UserInfoModel = new UserInfoModel({} as UserInfo)//你
  aboutToAppear(): void {
  //获取和我对话的用户信息
    this.getTalkUser()
  }
  getTalkUser(){
  this.talkUser = router.getParams() as UserInfoModel
  }
  build() {
    Column(){
      Stack({
        alignContent:Alignment.Start
      }){

        Text(this.talkUser.username)
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


      BottomInput()
    }
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)

  }
}