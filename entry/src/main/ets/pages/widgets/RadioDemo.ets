import { SafeArea } from "../../framework/@Framework"
let optionList:Array<Option> = []
@Entry
@Component
struct RadioDemo{

  aboutToAppear(): void {
    optionList = [new Option("美女","value1"),new Option("大美女","value2"),new Option("小美女","value3"),new Option("一般美女","value4")]
  }

  @Builder
  buildContent(){
      ForEach(optionList,(item:Option,index:number)=>{
        Row(){
          Radio({value:item.key,group:"group"})
          Text(item.title)
        }
      })
  }

  build() {
    Column(){

      // Row(){
      //   Radio({value:"key",group:"group"})
      //   Text("option")
      // }

      // SafeArea({builder:this.buildOption("美女","value1")})
      SafeArea({builder:this.buildContent})
      // this.buildContent()
    }
  }
}

class Option{
  title:string = ""
  key:string = ""

  constructor(title:string,key:string) {
    this.title = title
    this.key = key
  }
}