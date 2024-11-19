import { router } from "@kit.ArkUI"
import { ListItemData } from '../../bean/ListItemData';
import { CommonListItem } from '../../common/CommonBuilder';
import { SizeProps } from '../../framework/@Framework';


@Entry
@Component
struct WidgetsDemo{

  @State itemDataList: ListItemData[] = [
    new ListItemData("ButtonDemo",()=>{
      router.pushUrl({url:"pages/widgets/ButtonDemo"})
    }),
    new ListItemData("RadioDemo",()=>{
      router.pushUrl({url:"pages/widgets/RadioDemo"})
    }),
    new ListItemData("ToggleDemo",()=>{
      router.pushUrl({url:"pages/widgets/ToggleDemo"})
    }),
    new ListItemData("ProgressDemo",()=>{
      router.pushUrl({url:"pages/widgets/ProgressDemo"})
    }),
    new ListItemData("ImageDemo",()=>{
      router.pushUrl({url:"pages/widgets/ImageDemo"})
    }),
    new ListItemData("TextAndSpanDemo",()=>{
      router.pushUrl({url:"pages/widgets/TextAndSpanDemo"})
    }),
    new ListItemData("TextInputAndTextAreaDemo",()=>{
      router.pushUrl({url:"pages/widgets/TextInputAndTextAreaDemo"})
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

