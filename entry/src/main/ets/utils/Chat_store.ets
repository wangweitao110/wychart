//首选项读取数据
import { preferences } from '@kit.ArkData'
import {WeChat_StoreKey,WeChat_ConnectKey} from '../constant/Index'
import {DefaultUserList, UserInfoModel} from '../models/User'
import { JSON } from '@kit.ArkTS'

//实现单例
export  class weChatStore{
  //获取首选项的仓库
  static getWeChatStore(){
   return preferences.getPreferencesSync(getContext(),{
      name:WeChat_StoreKey
    })
  }
  //获取微信联系人
  static  getWeChatConnect(){
    const store = weChatStore.getWeChatStore()
   return JSON.parse( store.getSync(WeChat_ConnectKey,JSON.stringify(DefaultUserList)) as string) as UserInfoModel[]
  }
}