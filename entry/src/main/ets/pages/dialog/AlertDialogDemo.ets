import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct AlertDialogDemo{


  private showAlertDialog(){
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

  build() {
    Column(){
      Button("弹出AlertDialog")
        .onClick((ev)=>{
          this.showAlertDialog()
      })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}