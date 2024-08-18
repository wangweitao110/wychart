import { http } from '@kit.NetworkKit'
import { ChatResponse } from '../models/Chat'
const req = http.createHttp()
export async  function getRequestMessage (content:string) {
  try {

    const res = await req.request(`https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken=${encodeURIComponent(content)}`)
    return JSON.parse(res.result as string) as ChatResponse

  } catch (error) {
    return Promise.reject(error)
  }
}
