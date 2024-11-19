//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-create-looping-V5
import { BasicDataSource } from "../../framework/base/BasicDataSource"
import { SizeProps } from "../../framework/@Framework"

@Entry
@Component
struct SwiperDemo{
  @State dataSource:BasicDataSource<string> = new BasicDataSource()
  private swiperController:SwiperController = new SwiperController()

  aboutToAppear(): void {
    for (let index = 0; index < 10; index++) {
      this.dataSource.pushData(`item${index}`)
    }
  }

  build() {
    Column() {
      Swiper(this.swiperController){
        LazyForEach(this.dataSource,(item:string,index:number)=>{
          ListItem(){
            Text(item)
              .width(SizeProps.FULL_WINDOW)
              .height(200)
              .backgroundColor(Color.Red)
              .fontSize(30)
              .textAlign(TextAlign.Center)
          }
        },(item:string)=>item)
      }.indicator(
        Indicator.dot()
          // .left(0)
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(30)
          .selectedItemHeight(15)
          .color(Color.Orange)
          .selectedColor(Color.Blue)
      )
      Row(){
        Button("下一个")
          .onClick(()=>{
            this.swiperController.showNext()
          })
        Button("上一个")
          .onClick(()=>{
            this.swiperController.showPrevious()
          })
      }
      .width(SizeProps.FULL_WINDOW)
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
  }
}