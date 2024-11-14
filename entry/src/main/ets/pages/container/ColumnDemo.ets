@Entry
@Component
struct ColumnDemo{
  build() {
    Column(){
      Text("1").width(100).height(100).backgroundColor(Color.Pink).textAlign(TextAlign.Center)
      Text("2").width(100).height(100).backgroundColor(Color.Red).textAlign(TextAlign.Center)
      Text("3").width(100).height(100).backgroundColor(Color.Yellow).textAlign(TextAlign.Center)
      Text("4").width(100).height(100).backgroundColor(Color.Green).textAlign(TextAlign.Center)
      Text("5").width(100).height(100).backgroundColor(Color.Orange).textAlign(TextAlign.Center)
    }
    .alignItems(HorizontalAlign.Start)
    .width("100%")
    .height("100%")
  }
}