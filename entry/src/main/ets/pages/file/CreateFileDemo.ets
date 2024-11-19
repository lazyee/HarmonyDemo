import { common } from '@kit.AbilityKit'
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit'
import { buffer } from '@kit.ArkTS'
import { SizeProps } from '../../framework/@Framework'

@Entry
@Component
struct CreateFileDemo{
  private ctx: Context = getContext(this) as common.UIAbilityContext
  private filesDir = this.ctx.filesDir

  private createFile(){
    //新建并打开文件
    let file = fs.openSync(`${this.filesDir}/test.txt`,fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE )
    console.log(`fileDir:${file.path}`)
    //写入内容到文件
    let writeLen = fs.writeSync(file.fd,"harmony 垃圾")
    console.log(`写入长度:${writeLen}`)
    //从文件读取一段内容
    let arrayBuffer = new ArrayBuffer(1024)
    let readOptions: ReadOptions = {
      offset: 0,
      length: arrayBuffer.byteLength
    }

    let readLen = fs.readSync(file.fd,arrayBuffer,readOptions)
    let buf = buffer.from(arrayBuffer,0,readLen)
    console.log(`内容：${buf.toString()}`)

    //关闭文件
    fs.close(file)
  }

  build() {
    Column(){
      Button("新建并读写一个文件")
        .onClick((ev)=>{
          this.createFile()
        })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}