
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
class BasicDataSource<T> implements IDataSource{
  private listeners: DataChangeListener[] = []
  private originDataSource: T[] = []

  totalCount(): number {
    return this.originDataSource.length
  }

  getData(index: number): T {
    return this.originDataSource[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if(this.listeners.indexOf(listener) < 0){
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let position = this.listeners.indexOf(listener)
    if(position >= 0){
      this.listeners.splice(position,1)
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(){
    this.listeners.forEach((listener)=>{
      listener.onDataReloaded()
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index:number){
    this.listeners.forEach((listener)=>{
      listener.onDataAdd(index)
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index:number){
    this.listeners.forEach((listener)=>{
      listener.onDataChange(index)
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index:number){
    this.listeners.forEach((listener)=>{
      listener.onDataDelete(index)
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from:number,to:number){
    this.listeners.forEach((listener)=>{
      listener.onDataMove(from,to)
    })
  }

  addData(index:number, data:T){
    this.originDataSource.splice(index,0,data)
    this.notifyDataAdd(index)
  }

  pushData(data:T){
    this.originDataSource.push(data)
    this.notifyDataAdd(this.originDataSource.length - 1)
  }
}
