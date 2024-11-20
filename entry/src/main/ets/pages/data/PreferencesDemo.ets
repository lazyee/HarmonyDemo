import { SizeProps } from '../../framework/@Framework'
import { preferences } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
import { UIContext } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct PreferencesDemo{
  private dataPreferences: preferences.Preferences | null = null
  aboutToAppear(): void {
    let options: preferences.Options = { name: "leeorz" }
    this.dataPreferences = preferences.getPreferencesSync(getContext(this),options)
  }

  build() {
    Column(){
      Button("写入字符串")
        .onClick((ev)=>{
          // this.showAudioViewPicker()
          console.log(`this.dataPreferences:${this.dataPreferences}`)
          this.dataPreferences?.put("name","leeorz",(err: BusinessError)=>{

          })
          this.dataPreferences?.flush()
        })
        .margin({bottom:10})
      Button("读取字符串")
        .onClick((ev)=>{
          // this.showAudioViewPicker()
          this.dataPreferences?.get("name","",(error,value)=>{
            // console.log(`${value.name}:${value.message}`)
            console.log(JSON.stringify(value))
          })

          // let value = this.dataPreferences?.getSync("name","")
          // console.log(JSON.stringify(value))
        })
        .margin({bottom:10})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}