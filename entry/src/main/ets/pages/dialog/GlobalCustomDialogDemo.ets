import { SizeProps } from '../../framework/@Framework'
import { customGlobalDialogBuilder } from './GlobalCustomDialog'

@Entry
@Component
struct GlobalCustomDialogDemo{

  private customDialogController: CustomDialogController = new CustomDialogController({
    builder: customGlobalDialogBuilder.bind(this,"harmony","垃圾",()=>{
      this.customDialogController.close()
    },()=>{
      this.customDialogController.close()
    }),
    alignment: DialogAlignment.Center,
    customStyle: true,
    autoCancel: false,
  })

  build() {
    Column(){
      Button("弹出GlobalCustomDialog")
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