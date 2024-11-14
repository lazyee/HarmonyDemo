//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-navigation-tabs-V5
@Entry
@Component
struct TabsDemo{
  @State currentTabsIndex: number = 1
  private tabsController:TabsController = new TabsController()
  @Builder buildIndexTabBar(){
    Button("hello")
  }

  changeTab(){
    // this.tabsController.changeIndex(0)
    // this.tabsController.
  }

  build() {
    Tabs({
      index:this.currentTabsIndex,
      barPosition:BarPosition.End,
      controller:this.tabsController}){
      TabContent(){
        Text("这个是首页")
      }
        .backgroundColor(Color.Orange)
        .tabBar("首页")
        // .tabBar(this.buildIndexTabBar)
      TabContent(){
        Text("这个是分类")
      }
      .backgroundColor(Color.Orange)
      .tabBar("分类")
      TabContent(){
        Text("个人中心")
      }
      .backgroundColor(Color.Orange)
      .tabBar("我的")
    }.onChange((index:number)=>{
      this.currentTabsIndex = index
      console.log(`onChange currentTabsIndex:${this.currentTabsIndex}`)
    })
  }
}