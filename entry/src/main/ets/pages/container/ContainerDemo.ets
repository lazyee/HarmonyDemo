import { router } from "@kit.ArkUI"
import { ListItemData } from '../../bean/ListItemData';
import { CommonListItem } from '../../common/CommonBuilder';
import { SizeProps } from '../../framework/@Framework';


@Entry
@Component
struct ContainerDemo{
  @State itemDataList: ListItemData[] = [
    new ListItemData("Row",()=>{
      router.pushUrl({url:"pages/container/RowDemo"})
    }),
    new ListItemData("Column",()=>{
      router.pushUrl({url:"pages/container/ColumnDemo"})
    }),
    new ListItemData("Stack",()=>{
      router.pushUrl({url:"pages/container/StackDemo"})
    }),
    new ListItemData("Flex",()=>{
      router.pushUrl({url:"pages/container/FlexDemo"})
    }),
    new ListItemData("RelativeContainer",()=>{
      router.pushUrl({url:"pages/container/RelativeContainerDemo"})
    }),
    new ListItemData("MediaQuery",()=>{
      router.pushUrl({url:"pages/container/MediaQueryDemo"})
    }),
    new ListItemData("List LazyForEach",()=>{
      router.pushUrl({url:"pages/container/LazyForEachListDemo"})
    }),
    new ListItemData("Grid LazyForEach",()=>{
      router.pushUrl({url:"pages/container/LazyForEachGridDemo"})
    }),
    new ListItemData("SwiperDemo",()=>{
      router.pushUrl({url:"pages/container/SwiperDemo"})
    }),
    new ListItemData("TabsDemo",()=>{
      router.pushUrl({url:"pages/container/TabsDemo"})
    }),
  ];



  build() {
    List(){
      ForEach(this.itemDataList,(item:ListItemData,index:number)=>{
        CommonListItem(item,index)
      })
    }.divider({strokeWidth:0.5,color:0xC0C0C0})
    .backgroundColor(Color.White)
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
  }
}

