import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct ImageDemo{
  build() {
    Scroll(){
      Column(){
        Image("https://pics0.baidu.com/feed/e824b899a9014c08dba4ab83c264e9067bf4f42c.jpeg@f_auto?token=b9e98c94e5d7b8dead7ee0b77abb6ca0")
          .objectFit(ImageFit.Contain)
          .width(SizeProps.FULL_WINDOW)
          .height(200)
          .onComplete((info)=>{
            console.log(`width:${info?.width}`)
            console.log(`height:${info?.height}`)
            console.log(`componentWidth:${info?.componentWidth}`)
            console.log(`componentHeight:${info?.componentHeight}`)
        })
        // Image("")
        Image($r("app.media.avatar"))
          .objectFit(ImageFit.Contain)
          .width(SizeProps.FULL_WINDOW)
          .height(200)
      }
    }
  }
}