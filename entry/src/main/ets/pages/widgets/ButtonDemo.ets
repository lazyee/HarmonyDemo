import { SafeArea } from "../../framework/@Framework"
@Entry
@Component
struct ButtonDemo{
  @Builder
  buildContent(){
    Button("this is Normal button",{type: ButtonType.Normal,stateEffect:true})
    Button("this is Capsule button",{type: ButtonType.Capsule,stateEffect:true})
    Button("圆",{type: ButtonType.Circle,stateEffect:true})
      .fontSize(20)
      .padding(0)
  }

  build() {
    Column(){
      SafeArea({builder:this.buildContent})
    }
  }
}