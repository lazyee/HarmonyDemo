import { SizeProps } from '../../framework/constants/SizeProps'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct RichEditorDemo{
  richEditorController = new RichEditorController()
  richEditorStyledStringController = new RichEditorStyledStringController()
  redTextStyle:TextStyle = new TextStyle({ fontColor: Color.Red,fontSize: LengthMetrics.vp(15) })

  mutableStyleStringList: Array<MutableStyledString> = [
    new MutableStyledString("这是红色文字",
      [
        {
          start:0,
          length:6,
          styledKey: StyledStringKey.FONT,
          styledValue: this.redTextStyle
        }
      ]
    ),
  ]

  build() {

    Column(){
      Button("添加红色文字")
        .onClick((ev)=>{
          this.richEditorController.addTextSpan("这是红色文字",{style:{ fontColor: Color.Red,fontSize: 15 }})
          // this.richEditorStyledStringController.setStyledString(this.mutableStyleStringList[0])
        })
      Button("添加黄色文字")
        .onClick((ev)=>{
          this.richEditorController.addTextSpan("这是黄色文字",{style:{ fontColor: Color.Yellow,fontSize: 15 }})
        })
      Button("添加绿色文字")
        .onClick((ev)=>{
          this.richEditorController.addTextSpan("这是绿色文字",{style:{ fontColor: Color.Green,fontSize: 15 }})
        })
      Button("获取带样式的内容")
        .onClick((ev)=>{
          console.log(JSON.stringify(this.richEditorController.getSpans()))
        })
      RichEditor({controller: this.richEditorController})
      // RichEditor({controller: this.richEditorStyledStringController})
        .onWillChange((value: RichEditorChangeValue)=>{
          console.log(`onWillChange value:${JSON.stringify(value)};`)
          return true
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange)=>{
          console.log(`onDidChange rangeBefore:${JSON.stringify(rangeBefore)};rangeAfter:${rangeAfter};`)
        })
        .width(SizeProps.FULL_WINDOW)
        .height(200)
        .backgroundColor(Color.Gray)
        .border({radius: 10})
    }
  }
}