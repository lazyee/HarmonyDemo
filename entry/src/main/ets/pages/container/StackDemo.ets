//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-stack-layout-V5
@Entry
@Component
struct StackDemo{
  build() {
    Stack(){
      Text("1").width(100).height(100).backgroundColor(Color.Pink).textAlign(TextAlign.Center).position({top:0,left:0})
      Text("2").width(100).height(100).backgroundColor(Color.Red).textAlign(TextAlign.Center).position({top:0,right:0})
      Text("3").width(100).height(100).backgroundColor(Color.Yellow).textAlign(TextAlign.Center).position({left:0,bottom:0})
      Text("4").width(100).height(100).backgroundColor(Color.Green).textAlign(TextAlign.Center).position({right:0,bottom:0})
      Text("5").width(100).height(100).backgroundColor(Color.Orange).textAlign(TextAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}