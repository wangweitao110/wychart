//首选项读取数据
import { preferences } from '@kit.ArkData'
import {WeChat_StoreKey,WeChat_ConnectKey, WeChat_CurrentUserKey} from '../constant/Index'
import { currentUser, DefaultUserList, UserInfoModel} from '../models/User'
import { JSON } from '@kit.ArkTS'

//实现单例
export  class WeChatStore{
  static  context:Context
  //获取首选项的仓库
  static getWeChatStore(context?:Context){
   return preferences.getPreferencesSync(context || getContext(),{
      name:WeChat_StoreKey
    })
  }
  //获取微信联系人
  static  getWeChatConnect(){
    const store = WeChatStore.getWeChatStore()
   return JSON.parse( store.getSync(WeChat_ConnectKey,JSON.stringify(DefaultUserList)) as string) as UserInfoModel[]
  }
  //获取当前用户
  static getCurrentUser (context?:Context){
    const store = WeChatStore.getWeChatStore(context)
    return JSON.parse( store.getSync(WeChat_CurrentUserKey,JSON.stringify(currentUser)) as string) as UserInfoModel
  }
}