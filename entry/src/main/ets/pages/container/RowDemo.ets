//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-linear-V5
@Entry
@Component
struct RowDemo{
  build() {
    Row(){
      Text("1").width(100).height(100).backgroundColor(Color.Pink).textAlign(TextAlign.Center)
      Text("2").width(100).height(100).backgroundColor(Color.Red).textAlign(TextAlign.Center)
      Text("3").width(100).height(100).backgroundColor(Color.Yellow).textAlign(TextAlign.Center)
      Text("4").width(100).height(100).backgroundColor(Color.Green).textAlign(TextAlign.Center)
      Text("5").width(100).height(100).backgroundColor(Color.Orange).textAlign(TextAlign.Center)
    }
    .alignItems(VerticalAlign.Top)
    .width("100%")
    .height("100%")
  }
}