@Preview
@Component
struct BottomInput {
  @State
  showVoice:boolean = false //是否显示语音输入
  @State
  content:string = ""//输入内容
  sendTextMessage:(content:string)=>void =()=>{}
  build() {
    Row({space:10}){
      Image(this.showVoice ? $r('app.media.ic_public_keyboard'):$r('app.media.ic_public_sound'))
        .width(25)
        .height(25)
        .onClick(()=>{
          this.showVoice=!this.showVoice
        })
      if(this.showVoice){
        Button("按住说话")
          .type(ButtonType.Normal)
          .layoutWeight(1)
          .height(35)
          .borderRadius(2)
          .backgroundColor($r('app.color.white'))
          .fontColor($r('app.color.text_primary'))
      }else {
        TextInput({text:$$this.content})
          .layoutWeight(1)
          .height(35)
          .borderRadius(2)
          .backgroundColor($r('app.color.white'))
          .onSubmit(()=>{
            if(this.content){
              //有值就发送
              this.sendTextMessage(this.content)
              this.content = "" //输入框清空
            }
          })
      }

      Image($r('app.media.ic_public_add_norm'))
        .width(25)
        .height(25)
    }
    .padding({
      left:10,
      right:10
    })
    .height(60)
    .width('100%')
    .backgroundColor($r('app.color.second_back_color'))
  }
}
export default BottomInput