import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ToggleDemo{
  @State isSelectedAll:boolean = false
  build() {
    Column(){
      Toggle({type: ToggleType.Checkbox,isOn: this.isSelectedAll})
        .onChange((isOn:boolean)=>{
          this.isSelectedAll = isOn
          promptAction.showToast({message:isOn?"全选":"取消全选"})
      })
      Toggle({type: ToggleType.Switch,isOn: this.isSelectedAll})
      Toggle({type: ToggleType.Button,isOn: this.isSelectedAll}){
        Text("Toggle")
      }
    }
  }
}