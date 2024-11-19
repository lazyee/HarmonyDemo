import { ListItemData } from "../bean/ListItemData"

@Builder
export function CommonListItem(itemData:ListItemData,index:number){
  Text(itemData.name)
    .width("100%")
    .height(50)
    .textAlign(TextAlign.JUSTIFY)
    .padding({left:10})
    .onClick((ev)=>{
      itemData.action()
    })
}