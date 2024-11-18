import { ComponentContent, promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ModelDialogDemo{
  private customDialogId: number = 1001
  private customDialogController: CustomDialogController = new CustomDialogController({
    builder: this.customDialogBuilder,
    alignment: DialogAlignment.Center,
    customStyle: true,
    autoCancel: false,
  })

  build() {
    Column(){
      Button("AlertDialog").onClick(this.showAlertDialog)
      Button("ActionSheet").onClick(this.showActionSheet)
      Button("CustomDialog").onClick((ev)=>{
        this.customDialogController.open()
      })
    }
  }

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

  private showCustomDialog(){
    promptAction.openCustomDialog({builder: this.customDialogBuilder})
      .then((dialogId: number)=>{
        this.customDialogId = dialogId
      })
    // this.customDialogController.open()
  }

  private showAlertDialog(ev: ClickEvent){
    AlertDialog.show(
      {
        title: '这是标题',
        subtitle: '这是子标题',
        message: '这个是内容',
        autoCancel: true,
        alignment: DialogAlignment.Center,
        gridCount: 4,
        offset: { dx: 0, dy: -20 },
        primaryButton: {
          value: '取消',
          action: () => {
            console.info('Callback when the first button is clicked')
          }
        },
        secondaryButton: {
          enabled: true,
          defaultFocus: true,
          style: DialogButtonStyle.HIGHLIGHT,
          value: '确定',
          action: () => {
            console.info('Callback when the second button is clicked')
          }
        }
      }
    )
  }

  private showActionSheet(ev: ClickEvent){
    ActionSheet.show({
      title: 'ActionSheet title',
      subtitle: 'ActionSheet subtitle',
      message: 'message',
      autoCancel: true,
      confirm: {
        defaultFocus: true,
        value: 'Confirm button',
        action: () => {
          console.log('Get Alert Dialog handled')
        }
      },
      alignment: DialogAlignment.Bottom,
      offset: { dx: 0, dy: -10 },
      sheets: [
        {
          title: 'apples',
          action: () => {
            console.log('apples')
          }
        },
        {
          title: 'bananas',
          action: () => {
            console.log('bananas')
          }
        },
        {
          title: 'pears',
          action: () => {
            console.log('pears')
          }
        }
      ]
    })
  }
}