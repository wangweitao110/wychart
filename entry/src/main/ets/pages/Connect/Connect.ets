
import { UserInfoModel } from '../../models/User'
import { WeChatStore } from '../../utils/Chat_store'
import { router, Router } from '@kit.ArkUI'


@Component
struct Connect {
  @State
  userList:UserInfoModel[]=[]
  @State
  filterList:UserInfoModel[]=[]//筛选之后的数组

  @State
  @Watch("updateFilterList")
  searchName:string = ""

  aboutToAppear(): void {
   this.getUserList()
  }

  getUserList(){
    this.userList= WeChatStore.getWeChatConnect()
    this.updateFilterList()
  }

  updateFilterList(){
    if(this.searchName){
     this.filterList = this.userList.filter(item=>item.username.includes(this.searchName))
      //搜索
      return
    }else {
      this.filterList =this.userList
    }
  }

  build() {
    Column(){
      Row(){
        Search({placeholder:'搜索',value:$$this.searchName})
          .height(30)
          .borderRadius(4)
          .backgroundColor($r('app.color.white'))
      }
      .width('100%')
      .padding({
        left:10,
        right:10
      })
      List(){
         ForEach(this.userList,(item:UserInfoModel)=>{
           ListItem(){
             Row({space:10}){
               Image(item.avatar)
                 .width(30)
                 .height(30)
                 .borderRadius(4)
               Text(item.username)
                 .fontSize(14)
                 .fontColor($r('app.color.text_primary'))
             }
             .height(60)
             .width('100%')
             .padding({
               left:10,
               right:10
             })
           }
           .stateStyles({
             pressed:{
               .backgroundColor($r('app.color.back_color'))
             },
             normal:{
               .backgroundColor($r('app.color.white'))
             }
           })
           .onClick(()=>{
             router.pushUrl({
               url:'/pages/ChatDetail/ChatDetail',
               params:item
             })
           })
         })
      }
      .layoutWeight(1)
      .divider({
        strokeWidth:1,
        color:$r('app.color.border_color')
      })
      .backgroundColor($r('app.color.white'))

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.back_color'))
  }
}

export default Connect