import { router } from '@kit.ArkUI'

@Entry
@Component
struct ChatDetall {


  build() {
    Column(){
      Stack({
        alignContent:Alignment.Start
      }){

        Text("小果果")
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


    }
  }
}