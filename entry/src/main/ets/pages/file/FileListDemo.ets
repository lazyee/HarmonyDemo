import { common } from '@kit.AbilityKit'
import { fileIo as fs, ListFileOptions, ReadOptions } from '@kit.CoreFileKit'
import { buffer, List } from '@kit.ArkTS'
import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct FileListDemo{
  private ctx: Context = getContext(this) as common.UIAbilityContext
  private filesDir = this.ctx.filesDir

  getListFile(){
    let listFileOption: ListFileOptions = {
      recursion: false,
      listNum: 0,
      filter: {
        suffix: [".png",".jpg",".txt"],
        displayName: ["test*"],
        fileSizeOver: 0,
        lastModifiedAfter: new Date(0).getTime()
      }
    }

    let fileList = fs.listFileSync(this.filesDir,listFileOption)
    fileList.forEach((item,index)=>{
      console.log(`文件名:${item}`)
    })
  }

  build() {
    Column(){
      Button("查看文件列表")
        .onClick((ev)=>{
          this.getListFile()
        })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}