import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct CustomDialogDemo{
  private customDialogController: CustomDialogController = new CustomDialogController({
    builder: this.customDialogBuilder,
    alignment: DialogAlignment.Center,
    customStyle: true,
    autoCancel: false,
  })

  @Builder
  customDialogBuilder(){
    Column() {
      Text('这个是标题').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '请输入文本'}).height(60).width('90%')
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.customDialogController.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            this.customDialogController.close()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
    .border({radius:10})
    .backgroundColor(Color.White)
  }

  build() {
    Column(){
      Button("弹出CustomDialog")
        .onClick((ev)=>{
          this.customDialogController.open()
      })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}