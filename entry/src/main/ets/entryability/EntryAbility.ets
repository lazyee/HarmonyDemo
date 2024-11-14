import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { FullScreenManager } from "../framework/manager/FullScreenManager"

export default class EntryAbility extends UIAbility {
  private fullScreenManager:FullScreenManager = new FullScreenManager()

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Demo', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
      this.fullScreenManager.init(windowStage)
    //   //获取应用主窗口
    //   let windowsClass: window.Window = windowStage.getMainWindowSync()
    //   //1. 设置窗口全屏
    //   let isLayoutFullScreen = true
    //   windowsClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(()=>{
    //     console.info('Succeeded in setting the window layout to full-screen mode.');
    //   }).catch((err:BusinessError)=>{
    //     console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
    //   })
    //   //2.获取布局避让遮挡的区域
    //   let navigationBarType = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR//导航条避让
    //   let navigationBarAvoidArea = windowsClass.getWindowAvoidArea(navigationBarType)
    //   let navigationBarHeight = navigationBarAvoidArea.bottomRect.height
    //   AppStorage.setOrCreate("navigationBarHeight",navigationBarHeight)
    //
    //   let statusBarType = window.AvoidAreaType.TYPE_SYSTEM//状态栏避让
    //   let statusBarAvoidArea = windowsClass.getWindowAvoidArea(statusBarType)
    //   let statusBarHeight = statusBarAvoidArea.topRect.height
    //   AppStorage.setOrCreate("statusBarHeight",statusBarHeight)
    //
    //   //3.注册监听函数，动态获取避让区域数据
    //   windowsClass.on("avoidAreaChange",(avoidAreaOptions)=>{
    //     if(avoidAreaOptions.type == window.AvoidAreaType.TYPE_SYSTEM){
    //       let statusBarHeight = avoidAreaOptions.area.topRect.height
    //       AppStorage.setOrCreate("statusBarHeight",statusBarHeight)
    //     }else if(avoidAreaOptions.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR){
    //       let navigationBarHeight = avoidAreaOptions.area.bottomRect.height
    //       AppStorage.setOrCreate("navigationBarHeight",navigationBarHeight)
    //     }
    //   })
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    this.fullScreenManager.removeAvoidAreaChangeListener()
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
