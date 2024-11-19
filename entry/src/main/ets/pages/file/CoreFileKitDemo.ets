import { ListItemData } from '../../bean/ListItemData'
import { CommonListItem } from '../../common/CommonBuilder'
import { router } from '@kit.ArkUI'
import { SizeProps } from '../../framework/constants/SizeProps'

@Entry
@Component
struct CoreFileKitDemo{
  @State itemDataList: ListItemData[] = [
    new ListItemData("新建并读写一个文件",()=>{
      router.pushUrl({url:"pages/file/CreateFileDemo"})
    }),
    new ListItemData("查看文件列表",()=>{
      router.pushUrl({url:"pages/file/FileListDemo"})
    }),
    new ListItemData("临时授权方式使用媒体文件uri",()=>{
      router.pushUrl({url:"pages/file/TempAuthGetMediaUrlDemo"})
    })
  ]

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