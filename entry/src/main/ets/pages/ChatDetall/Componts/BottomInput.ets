@Preview
@Component
struct BottomInput {
  build() {
    Row({space:10}){
      Image($r('app.media.ic_public_sound'))
        .width(25)
        .height(25)
      TextInput()
        .layoutWeight(1)
        .height(35)
        .borderRadius(2)
        .backgroundColor($r('app.color.white'))
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