@Builder
export function customGlobalDialogBuilder(title: string,content: string,onClickCancel:()=>void,onClickConfirm:()=>void){
  Column() {
    Text(title).fontSize(20).margin({ top: 10, bottom: 10 })
    Text(content).fontSize(16).margin({ bottom: 10,top: 10 })
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Button('cancel')
        .onClick(() => {
          onClickCancel()
          // customGlobalDialogController.close()
        }).backgroundColor(0xffffff).fontColor(Color.Black)
      Button('confirm')
        .onClick(() => {
          onClickConfirm()
          // customGlobalDialogController.close()
        }).backgroundColor(0xffffff).fontColor(Color.Red)
    }.margin({ bottom: 10 })
  }
  .border({radius:10})
  .backgroundColor(Color.White)
}

@Builder
export function promptActionCustomGlobalDialogBuilder(param: PromptActionParam){
  Column() {
    Text(param.title).fontSize(20).margin({ top: 10, bottom: 10 })
    Text(param.content).fontSize(16).margin({ bottom: 10,top: 10 })
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Button('cancel')
        .onClick(() => {
          param.onClickCancel()
          // customGlobalDialogController.close()
        }).backgroundColor(0xffffff).fontColor(Color.Black)
      Button('confirm')
        .onClick(() => {
          param.onClickConfirm()
          // customGlobalDialogController.close()
        }).backgroundColor(0xffffff).fontColor(Color.Red)
    }.margin({ bottom: 10 })
  }
  .border({radius:10})
  .backgroundColor(Color.White)
}

export class PromptActionParam{
  title: string = ""
  content: string = ""
  onClickCancel: VoidCallback = ()=>{}
  onClickConfirm: VoidCallback = ()=>{}

  constructor(title: string,content: string,onClickCancel: VoidCallback,onClickConfirm: VoidCallback) {
    this.title = title
    this.content = content
    this.onClickCancel = onClickCancel
    this.onClickConfirm = onClickConfirm
  }
}

export let customGlobalDialogController: CustomDialogController = new CustomDialogController({
  builder: customGlobalDialogBuilder,
  alignment: DialogAlignment.Center,
  customStyle: true,
  autoCancel: false,
})

