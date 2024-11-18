@Entry
@Component
struct TextAndSpanDemo{
  build() {
    Text("this is text"){
      Span("this is span1").fontColor(Color.Red)
      //设置margin貌似无效
      Span("this is span2").fontColor(Color.Blue).margin({left: 20})
    }
    .border({width: 1,color: Color.Black})
    .padding(10)
  }
}