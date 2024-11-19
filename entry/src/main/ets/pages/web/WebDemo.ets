import { webview } from '@kit.ArkWeb'

@Entry
@Component
struct WebDemo{
  webviewController: webview.WebviewController = new webview.WebviewController()

  onBackPress(): boolean | void {
    if(this.webviewController.accessBackward()){
      this.webviewController.backward()
      return true
    }

    return false
  }

  build() {
    Column(){
      Web({src:"", controller: this.webviewController})
        .onControllerAttached(()=>{
          this.webviewController.loadUrl("https://www.baidu.com")
        })
    }
  }
}