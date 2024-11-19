import { ListItemData } from '../../bean/ListItemData';
import { router } from '@kit.ArkUI';
import { CommonListItem } from '../../common/CommonBuilder';
import { SizeProps } from '../../framework/@Framework';

@Entry
@Component
struct ModelDialogDemo{
  @State itemDataList: ListItemData[] = [
    new ListItemData("ActionSheetDemo",()=>{
      router.pushUrl({url:"pages/dialog/ActionSheetDemo"})
    }),
    new ListItemData("AlertDialogDemo",()=>{
      router.pushUrl({url:"pages/dialog/AlertDialogDemo"})
    }),
    new ListItemData("CustomDialogDemo",()=>{
      router.pushUrl({url:"pages/dialog/CustomDialogDemo"})
    }),
    new ListItemData("GlobalCustomDialogDemo",()=>{
      router.pushUrl({url:"pages/dialog/GlobalCustomDialogDemo"})
    }),
    new ListItemData("PromptActionDemo",()=>{
      router.pushUrl({url:"pages/dialog/PromptActionDemo"})
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