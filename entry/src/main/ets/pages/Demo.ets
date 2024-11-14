import { router } from "@kit.ArkUI"

@Entry
@Component
struct Demo{
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