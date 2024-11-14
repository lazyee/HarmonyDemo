import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { Keys } from "../constants/Keys"

export class FullScreenManager{
  private windowsClass: window.Window | null = null

  init(windowStage: window.WindowStage) {
    //获取应用主窗口
    this.windowsClass = windowStage.getMainWindowSync()
    //1. 设置窗口全屏
    let isLayoutFullScreen = true
    this.windowsClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
      console.info('Succeeded in setting the window layout to full-screen mode.');
    }).catch((err: BusinessError) => {
      console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
    })
    //2.获取布局避让遮挡的区域
    let navigationBarType = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR //导航条避让
    let navigationBarAvoidArea = this.windowsClass.getWindowAvoidArea(navigationBarType)
    let navigationBarHeight = navigationBarAvoidArea.bottomRect.height
    AppStorage.setOrCreate(Keys.kNavigationBarHeight, navigationBarHeight)

    let statusBarType = window.AvoidAreaType.TYPE_SYSTEM //状态栏避让
    let statusBarAvoidArea = this.windowsClass.getWindowAvoidArea(statusBarType)
    let statusBarHeight = statusBarAvoidArea.topRect.height
    AppStorage.setOrCreate(Keys.kStatusBarHeight, statusBarHeight)

    //3.注册监听函数，动态获取避让区域数据
    this.windowsClass.on("avoidAreaChange", this.onAvoidAreaChange)

  }

  private onAvoidAreaChange(avoidAreaOptions: window.AvoidAreaOptions){
    if (avoidAreaOptions.type == window.AvoidAreaType.TYPE_SYSTEM) {
      let statusBarHeight = avoidAreaOptions.area.topRect.height
      AppStorage.setOrCreate(Keys.kStatusBarHeight, statusBarHeight)
    } else if (avoidAreaOptions.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
      let navigationBarHeight = avoidAreaOptions.area.bottomRect.height
      AppStorage.setOrCreate(Keys.kNavigationBarHeight, navigationBarHeight)
    }
  }

  removeAvoidAreaChangeListener(){
    this.windowsClass?.off("avoidAreaChange")
  }
}