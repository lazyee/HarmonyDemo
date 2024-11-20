import { SizeProps } from '../../framework/@Framework'
import { fileShare, picker } from '@kit.CoreFileKit'
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit'
import { buffer } from '@kit.ArkTS'

@Entry
@Component
struct FileAccessPersistDemo{
  private persistPermissionUri: string = ""
  private testPersistPermissionUri: string = "file://docs/storage/Users/currentUser/Download/harmony_test.txt"
  /**
   * 文件持久化授权
   */
  async filePersistPermission(){
    try {
      let documentSelectOptions = new picker.DocumentSelectOptions();
      let documentPicker = new picker.DocumentViewPicker()
      documentSelectOptions.maxSelectNumber = 1
      let uris = await documentPicker.select(documentSelectOptions)
      if(uris.length == 0) return
      let policyInfo: fileShare.PolicyInfo = {
        uri: uris[0],
        operationMode: fileShare.OperationMode.READ_MODE
      }
      let policies: Array<fileShare.PolicyInfo> = [policyInfo]
      fileShare.persistPermission(policies).then(()=>{
        console.info(`持久化授权成功;uri:${uris[0]}`);
        promptAction.showToast({message: "持久化授权成功"})
        this.persistPermissionUri = uris[0]
      })
     } catch (err) {
      if (err.code == 13900001 && err.data) {
        for (let i = 0; i < err.data.length; i++) {
          console.error("error code : " + JSON.stringify(err.data[i].code));
          console.error("error uri : " + JSON.stringify(err.data[i].uri));
          console.error("error reason : " + JSON.stringify(err.data[i].message));
        }
      }
      promptAction.showToast({message: "persistPermission failed with error message: " + err.message + ", error code: " + err.code})
    }
  }

  /**
   * 取消文件持久化授权
   */
  async revokeFilePersistPermission(){
    if(this.persistPermissionUri == ""){
      promptAction.showToast({message: "还没有已经持久化授权的文件"})
      return
    }
    try {
      let policyInfo: fileShare.PolicyInfo = {
        uri: this.persistPermissionUri,
        operationMode: fileShare.OperationMode.READ_MODE
      }
      let policies: Array<fileShare.PolicyInfo> = [policyInfo]
      fileShare.revokePermission(policies).then(()=>{
        promptAction.showToast({message: "取消持久化授权成功"})
        console.log(`取消持久化授权成功;${this.persistPermissionUri}`)
        this.persistPermissionUri = ""
      }).catch((err: BusinessError<Array<fileShare.PolicyErrorResult>>)=>{
        console.error("revokePermission failed with error message: " + err.message + ", error code: " + err.code);
        if (err.code == 13900001 && err.data) {
          for (let i = 0; i < err.data.length; i++) {
            console.error("error code : " + JSON.stringify(err.data[i].code));
            console.error("error uri : " + JSON.stringify(err.data[i].uri));
            console.error("error reason : " + JSON.stringify(err.data[i].message));
          }
        }
      })
    }catch (error){
      let err: BusinessError = error as BusinessError;
      console.error('revokePermission failed with err: ' + JSON.stringify(err));
    }
  }

  /**
   * 激活文件持久化
   */
  async activateFilePersistPermission(){
    try {
      let policyInfo: fileShare.PolicyInfo = {
        uri: this.testPersistPermissionUri,
        operationMode: fileShare.OperationMode.READ_MODE
      }
      let policies: Array<fileShare.PolicyInfo> = [policyInfo]
      fileShare.activatePermission(policies).then(()=>{
        promptAction.showToast({message: "激活已经持久化的文件"})
        console.log(`激活已经持久化的文件;${this.testPersistPermissionUri}`)
      }).catch((err: BusinessError<Array<fileShare.PolicyErrorResult>>)=>{
        console.error("activatePermission failed with error message: " + err.message + ", error code: " + err.code);
        if (err.code == 13900001 && err.data) {
          for (let i = 0; i < err.data.length; i++) {
            console.error("error code : " + JSON.stringify(err.data[i].code));
            console.error("error uri : " + JSON.stringify(err.data[i].uri));
            console.error("error reason : " + JSON.stringify(err.data[i].message));
            if (err.data[i].code == fileShare.PolicyErrorCode.PERMISSION_NOT_PERSISTED) {
              //可以选择进行持久化后再激活。
            }
          }
        }
      });
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error('activatePermission failed with err: ' + JSON.stringify(err));
    }
  }

  /**
   * 激活文件持久化
   */
  async checkFilePersistentPermission(){
    try {
      let policyInfo: fileShare.PolicyInfo = {
        uri: this.testPersistPermissionUri,
        operationMode: fileShare.OperationMode.READ_MODE
      }
      let policies: Array<fileShare.PolicyInfo> = [policyInfo]
      let hasPersistPermission =  await fileShare.checkPersistentPermission(policies)

      console.log(`hasPersistPermission:${JSON.stringify(hasPersistPermission)}`)
      console.log(`${this.testPersistPermissionUri};持久化授权状态:${hasPersistPermission[0]}`)
      promptAction.showToast({message: hasPersistPermission[0] ? "有持久化授权" : "无持久化授权"})

    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error('checkPersistentPermission failed with err: ' + JSON.stringify(err));
    }
  }

  /**
   * 读取持久化授权文件内容
   */
  private readPersistPermissionFile(){
    let filePath = this.testPersistPermissionUri
    //新建并打开文件
    let file = fs.openSync(filePath,fs.OpenMode.READ_WRITE)
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
      Button("文件授权持久化")
        .onClick((ev)=>{
          this.filePersistPermission()
        })
        .margin({bottom:10})
      Button("取消文件授权持久化")
        .onClick((ev)=>{
          this.revokeFilePersistPermission()
        })
        .margin({bottom:10})
      Button("激活已经持久化的权限访问")
        .onClick((ev)=>{
          this.activateFilePersistPermission()
        })
        .margin({bottom:10})
      Button("检查文件的持久化授权")
        .onClick((ev)=>{
          this.checkFilePersistentPermission()
        })
        .margin({bottom:10})
      Button("读取持久化授权的文件内容")
        .onClick((ev)=>{
          this.readPersistPermissionFile()
        })
        .margin({bottom:10})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}