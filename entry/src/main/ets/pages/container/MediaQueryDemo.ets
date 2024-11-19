//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-media-query-V5
import { mediaquery, window } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct MediaQueryDemo{
  @State textColor:Color = Color.Black
  @State textBackgroundColor:Color = Color.Orange
  // 当设备横屏时条件成立
  listener:mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync("(orientation: landscape)")

  onOrientationChanged(mediaQueryResult:mediaquery.MediaQueryResult){
    if(mediaQueryResult.matches as boolean){// 若设备为横屏状态，更改相应的页面布局
      this.textColor = Color.White
      this.textBackgroundColor = Color.Black
    }else{
      this.textColor = Color.Black
      this.textBackgroundColor = Color.Orange
    }
  }

  aboutToAppear(): void {
    this.listener.on("change",(mediaQueryResult:mediaquery.MediaQueryResult)=>{
      this.onOrientationChanged(mediaQueryResult)
    })
  }

  aboutToDisappear(): void {
    this.listener.off("change")
  }

  private changeOrientation(isLandscape: boolean){
    let context:common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext
    window.getLastWindow(context).then((lastWindow)=>{
      lastWindow.setPreferredOrientation(isLandscape? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    })
  }

  build() {
    Column(){
      Text("点击切换横屏").fontColor(this.textColor).backgroundColor(this.textBackgroundColor).width(100).height(50).textAlign(TextAlign.Center)
        .onClick((ev)=>{
          this.changeOrientation(true)
        })
      Text("点击切换竖屏").fontColor(this.textColor).backgroundColor(this.textBackgroundColor).width(100).height(50).textAlign(TextAlign.Center)
        .onClick((ev)=>{
          this.changeOrientation(false)
        })
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
  }
}