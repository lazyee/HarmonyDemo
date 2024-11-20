import { SizeProps } from '../../framework/@Framework'
import { common } from '@kit.AbilityKit'
import { picker } from '@kit.CoreFileKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct AudioViewPickerDemo{

  private showAudioViewPicker(){
    let uris: Array<string> = []
    let context = getContext(this) as common.Context
    let audioSelectOptions = new picker.AudioSelectOptions()
    audioSelectOptions.maxSelectNumber = 1

    let audioViewPicker = new picker.AudioViewPicker(context)
    audioViewPicker.select(audioSelectOptions)
      .then((audioSelectResult: Array<string>)=>{
        uris = audioSelectResult
        console.info('audioViewPicker.select to file succeed and uris are:' + uris);
      }).catch((err: BusinessError)=>{
        console.error(`Invoke audioViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
    })
  }

  build() {
    Column(){
      Button("showAudioViewPicker")
        .onClick((ev)=>{
          this.showAudioViewPicker()
        })
        .margin({bottom:10})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}