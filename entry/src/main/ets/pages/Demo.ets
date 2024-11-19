import { router } from "@kit.ArkUI"
import { ListItemData } from '../bean/ListItemData'
import { CommonListItem } from '../common/CommonBuilder'
import { Keys, SizeProps } from '../framework/@Framework'

@Entry
@Component
struct Demo{
  @StorageProp(Keys.kNavigationBarHeight)
  navigationBarHeight:number = 0
  @StorageProp(Keys.kStatusBarHeight)
  statusBarHeight:number = 0

  @State itemDataList: ListItemData[] = [
    new ListItemData("ContainerDemo",()=>{
      router.pushUrl({url:"pages/container/ContainerDemo"})
    }),
    new ListItemData("WidgetsDemo",()=>{
      router.pushUrl({url:"pages/widgets/WidgetsDemo"})
    }),
    new ListItemData("ModelDialogDemo",()=>{
      router.pushUrl({url:"pages/dialog/ModelDialogDemo"})
    }),
    new ListItemData("AnimateToDemo",()=>{
      router.pushUrl({url:"pages/animate/AnimateToDemo"})
    }),
    new ListItemData("WebDemo",()=>{
      router.pushUrl({url:"pages/web/WebDemo"})
    }),
    new ListItemData("CoreFileKitDemo",()=>{
      router.pushUrl({url:"pages/file/CoreFileKitDemo"})
    })
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
    .padding({top:px2vp(this.statusBarHeight),bottom:px2vp(this.navigationBarHeight)})
  }
}

