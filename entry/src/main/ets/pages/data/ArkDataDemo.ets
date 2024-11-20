import { ListItemData } from '../../bean/ListItemData';
import { router } from '@kit.ArkUI';
import { CommonListItem } from '../../common/CommonBuilder';
import { SizeProps } from '../../framework/@Framework';

@Entry
@Component
struct ArkDataDemo{
  @State itemDataList: ListItemData[] = [
    new ListItemData("PreferencesDemo",()=>{
      router.pushUrl({url:"pages/data/PreferencesDemo"})
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