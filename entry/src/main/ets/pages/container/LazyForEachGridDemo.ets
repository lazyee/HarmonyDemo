//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-create-grid-V5
import { BasicDataSource } from "../../framework/base/BasicDataSource"
@Entry
@Component
struct LazyForEachGridDemo{
  @State dataSource:BasicDataSource<string> = new BasicDataSource()

  aboutToAppear(): void {
    for (let index = 0; index < 1000; index++) {
      this.dataSource.pushData(`item${index}`)
    }
  }

  build() {
    Grid(){
      LazyForEach(this.dataSource,(item:string,index:number)=>{
        GridItem(){
          Text(item)
            // .width(100)
            .height(100)
            // .width(SizeProps.MATCH_CONTENT)
            // .height(SizeProps.MATCH_CONTENT)
            // .backgroundColor(Color.Red)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor(Color.Red)
      },(item:string)=>item)
    }
    //如果设置的是columnsTemplate，Grid的滚动方向为垂直方向；如果设置的是rowsTemplate，Grid的滚动方向为水平方向。
    .columnsTemplate('1fr 1fr 2fr')
    // .rowsTemplate('1fr 1fr 1fr 1fr')
    // .columnsTemplate('2fr 1fr 1fr 1fr 1fr 1fr')
    // .rowsTemplate('2fr 1fr 1fr 1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .cachedCount(10)
  }
}

