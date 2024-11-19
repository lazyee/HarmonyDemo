import { SizeProps } from '../../framework/constants/SizeProps'

@Entry
@Component
struct ActionSheetDemo{


  private showActionSheet(){
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

  build() {
    Column(){
      Button("弹出ActionSheet")
        .onClick((ev)=>{
          this.showActionSheet()
      })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}