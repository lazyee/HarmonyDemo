//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-relative-layout-V5
@Entry
@Component
struct RelativeContainerDemo{
  build() {
    RelativeContainer(){
      Text("1").width(100).height(100).backgroundColor(Color.Pink).textAlign(TextAlign.Center).id("text1")
        .alignRules(
          { top:{anchor:"__container__",align:VerticalAlign.Top} }
        )
      Text("2").width(100).height(100).backgroundColor(Color.Red).textAlign(TextAlign.Center).id("text2")
        .alignRules(
          {
            top:{anchor:"text1",align:VerticalAlign.Bottom},
            left:{anchor:"text1",align:HorizontalAlign.End}
          }
        )
        .offset({left:20,top:-50})//这里设置偏移
      Text("3").width(100).height(100).backgroundColor(Color.Yellow).textAlign(TextAlign.Center).id("text3")
        .alignRules(
          {
            top:{anchor:"text2",align:VerticalAlign.Top},
            left:{anchor:"text2",align:HorizontalAlign.Start}
          }
        ).offset({left:0,top:30})//这里貌似有问题，这里设置偏移之后，还是以text2未偏移前的位置信息来做便宜的锚点
      // Text("4").width(100).height(100).backgroundColor(Color.Green).textAlign(TextAlign.Center).id("text4")
      // Text("5").width(100).height(100).backgroundColor(Color.Orange).textAlign(TextAlign.Center).id("text5")
    }
    .width("100%")
    .height("100%")
  }
}