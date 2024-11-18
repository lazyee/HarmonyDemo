import { router } from "@kit.ArkUI"
import { Keys } from '../framework/@Framework'

@Entry
@Component
struct Demo{
  @StorageProp(Keys.kNavigationBarHeight)
  navigationBarHeight:number = 0
  @StorageProp(Keys.kStatusBarHeight)
  statusBarHeight:number = 0

  @State itemDataList: ItemData[] = [
    new ItemData("Row",()=>{
      router.pushUrl({url:"pages/container/RowDemo"})
    }),
    new ItemData("Column",()=>{
      router.pushUrl({url:"pages/container/ColumnDemo"})
    }),
    new ItemData("Stack",()=>{
      router.pushUrl({url:"pages/container/StackDemo"})
    }),
    new ItemData("Flex",()=>{
      router.pushUrl({url:"pages/container/FlexDemo"})
    }),
    new ItemData("RelativeContainer",()=>{
      router.pushUrl({url:"pages/container/RelativeContainerDemo"})
    }),
    new ItemData("MediaQuery",()=>{
      router.pushUrl({url:"pages/container/MediaQueryDemo"})
    }),
    new ItemData("List LazyForEach",()=>{
      router.pushUrl({url:"pages/container/LazyForEachListDemo"})
    }),
    new ItemData("Grid LazyForEach",()=>{
      router.pushUrl({url:"pages/container/LazyForEachGridDemo"})
    }),
    new ItemData("SwiperDemo",()=>{
      router.pushUrl({url:"pages/container/SwiperDemo"})
    }),
    new ItemData("TabsDemo",()=>{
      router.pushUrl({url:"pages/container/TabsDemo"})
    }),
    new ItemData("ButtonDemo",()=>{
      router.pushUrl({url:"pages/widgets/ButtonDemo"})
    }),
    new ItemData("RadioDemo",()=>{
      router.pushUrl({url:"pages/widgets/RadioDemo"})
    }),
    new ItemData("ToggleDemo",()=>{
      router.pushUrl({url:"pages/widgets/ToggleDemo"})
    }),
    new ItemData("ProgressDemo",()=>{
      router.pushUrl({url:"pages/widgets/ProgressDemo"})
    }),
    new ItemData("ImageDemo",()=>{
      router.pushUrl({url:"pages/widgets/ImageDemo"})
    }),
    new ItemData("TextAndSpanDemo",()=>{
      router.pushUrl({url:"pages/widgets/TextAndSpanDemo"})
    }),
    new ItemData("TextInputAndTextAreaDemo",()=>{
      router.pushUrl({url:"pages/widgets/TextInputAndTextAreaDemo"})
    }),
    new ItemData("ModelDialog",()=>{
      router.pushUrl({url:"pages/dialog/ModelDialogDemo"})
    }),
  ];

  @Builder _buildItem(itemData:ItemData,index:number){
    Text(itemData.name)
      .width("100%")
      .height(50)
      .textAlign(TextAlign.JUSTIFY)
      .padding({left:10})
      .onClick((ev)=>{
        itemData.action()
      })
  }

  build() {
    List(){
      ForEach(this.itemDataList,(item:ItemData,index:number)=>{
        this._buildItem(item,index)
      })
    }.divider({strokeWidth:0.5,color:0xC0C0C0})
    .backgroundColor(Color.White)
    .width("100%")
    .height("100%")
    .padding({top:px2vp(this.statusBarHeight),bottom:px2vp(this.navigationBarHeight)})
  }
}

class ItemData{
  name:string = ""
  action:VoidCallback = ()=>{}

  constructor(name:string,action:VoidCallback) {
    this.name = name
    this.action = action
  }
}