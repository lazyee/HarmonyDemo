//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-create-list-V5
import { BasicDataSource } from "../../framework/base/BasicDataSource"
@Entry
@Component
struct LazyForEachListDemo{
  @State dataSource:BasicDataSource<string> = new BasicDataSource()

  aboutToAppear(): void {
    for (let index = 0; index < 1000; index++) {
      this.dataSource.pushData(`item${index}`)
    }
  }

  build() {
    List(){
      LazyForEach(this.dataSource,(item:string,index:number)=>{
        ListItem(){
          Text(item)
        }
      },(item:string)=>item)
    }.cachedCount(10)
  }
}

