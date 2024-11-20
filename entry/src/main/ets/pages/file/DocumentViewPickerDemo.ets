import { SizeProps } from '../../framework/@Framework'
import { common } from '@kit.AbilityKit'
import { picker } from '@kit.CoreFileKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct DocumentViewPickerDemo{

  private showDocumentViewPicker(){
    let uris: Array<string> = []
    let context = getContext(this) as common.Context
    let documentSelectOptions = new picker.DocumentSelectOptions()
    documentSelectOptions.maxSelectNumber = 1
    // 指定选择的文件或者目录路径（可选）
    // documentSelectOptions.defaultFilePathUri = "file://docs/storage/Users/currentUser/test";
    // documentSelectOptions.defaultFilePathUri = "file://docs/storage/Users/currentUser/Download";
    // 选择文件的后缀类型['后缀类型描述|后缀类型']（可选） 若选择项存在多个后缀名，则每一个后缀名之间用英文逗号进行分隔（可选），后缀类型名不能超过100,选择所有文件：'所有文件(*.*)|.*';
    // documentSelectOptions.fileSuffixFilters = ['图片(.png, .jpg)|.png,.jpg', '文档|.txt', '视频|.mp4', '.pdf'];
    documentSelectOptions.fileSuffixFilters = ["文档|.docx,.doc"]
    //选择是否对指定文件或目录授权，true为授权，当为true时，defaultFilePathUri为必选参数，拉起文管授权界面；false为非授权，拉起常规文管界面（可选）
    documentSelectOptions.authMode = true;
    // documentSelectOptions.authMode = true;

    let documentViewPicker = new picker.DocumentViewPicker(context)
    documentViewPicker.select(documentSelectOptions)
      .then((documentSelectResult: Array<string>)=>{
        uris = documentSelectResult
        console.info('documentViewPicker.select to file succeed and uris are:' + uris);
      }).catch((err: BusinessError)=>{
        console.error(`Invoke documentViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
    })
  }

  build() {
    Column(){
      Button("showDocumentViewPicker")
        .onClick((ev)=>{
          this.showDocumentViewPicker()
        })
        .margin({bottom:10})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}