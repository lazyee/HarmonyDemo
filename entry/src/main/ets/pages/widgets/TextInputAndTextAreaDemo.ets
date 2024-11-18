@Entry
@Component
struct TextInputAndTextAreaDemo{
  textInputController: TextInputController = new TextInputController()
  textAreaController: TextAreaController = new TextAreaController()
  build() {
    Column(){
      TextInput({placeholder: "this is TextInput",controller: this.textInputController})
        .onChange((value)=>{
          console.log(value)
        })
        .onFocus(()=>{
          console.log("获取焦点")
        })
        .onBlur(()=>{
          console.log("失去焦点")
        })
      TextArea({placeholder: "this is TextArea",controller: this.textAreaController})
    }
  }
}