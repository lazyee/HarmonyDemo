import { curves } from '@kit.ArkUI'
import { SizeProps } from '../../framework/constants/SizeProps'

@Entry
@Component
struct AnimateToDemo{
  @State animate: boolean = false
  @State rotateValue: number = 0//旋转角度
  @State translateX: number = 0//偏移量
  @State opacityValue: number = 0//透明度
  @State borderRadiusValue: number = 30//圆角
  @State widgetBackgroundColor: string = "#00FF00"//背景颜色
  build() {
    Row(){
      Column(){

      }
      .rotate({angle: this.rotateValue})
      .backgroundColor("#317AF7")
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .borderRadius(30)
      .onClick(()=>{
        this.getUIContext()?.animateTo({curve: curves.springMotion()},()=>{
          this.animate = !this.animate

          this.rotateValue = this.animate? 90 : 0
          this.opacityValue = this.animate? 0.6 : 1
          this.translateX = this.animate? 50 : 0
          this.borderRadiusValue = this.animate? 0: 30
          this.widgetBackgroundColor = this.animate? "#D94838" : "#0FAAF0"
        })
      })

      Column(){

      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor(this.widgetBackgroundColor)
      .borderRadius(this.borderRadiusValue)
      .opacity(this.opacityValue)
      .translate({x: this.translateX})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
  }
}
