import { SizeProps } from '../../framework/@Framework'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { dataSharePredicates } from '@kit.ArkData'

@Entry
@Component
struct TempAuthGetMediaUrlDemo{

  private uris: Array<string> = []
  private context: Context = getContext(this)
  @State previewImageUri: string = ""

  async getUriFormPhotoPicker(){
    try{
      let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions()
      photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE
      photoSelectOptions.maxSelectNumber = 1
      let photoPicker = new photoAccessHelper.PhotoViewPicker()
      photoPicker.select(photoSelectOptions)
        .then((photoSelectResult: photoAccessHelper.PhotoSelectResult)=>{
          console.log(JSON.stringify(photoSelectResult))
          this.uris = photoSelectResult.photoUris
          this.getAssetsFormUri(this.uris)

          if(this.uris.length != 0){
            this.previewImageUri = this.uris[0]
          }
        }).catch((e: BusinessError)=>{
        console.log(`PhotoViewPicker select failed :${JSON.stringify(e)}`)
      })
    }catch (e){
      console.log(`PhotoViewPicker failed :${JSON.stringify(e)}`)
    }
  }

  /**
   * 获取媒体信息
   * @param uris
   */
  async getAssetsFormUri(uris: Array<string>){
    try {
      let accessHelper = photoAccessHelper.getPhotoAccessHelper(this.context)
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates()
      //配置查询条件，使用PhotoViewPicker选择图片返回的uri进行查询
      predicates.equalTo("uri",uris[0])
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [
          photoAccessHelper.PhotoKeys.WIDTH,
          photoAccessHelper.PhotoKeys.HEIGHT,
          photoAccessHelper.PhotoKeys.TITLE,
        ],
        predicates: predicates
      }
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await accessHelper.getAssets(fetchOptions)
      let assets: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject()
      console.info('asset displayName: ', assets.displayName);
      console.info('asset uri: ', assets.uri);
      console.info('asset photoType: ', assets.photoType);
      console.info('asset width: ', assets.get(photoAccessHelper.PhotoKeys.WIDTH));
      console.info('asset height: ', assets.get(photoAccessHelper.PhotoKeys.HEIGHT));
      console.info('asset title: ' + assets.get(photoAccessHelper.PhotoKeys.TITLE));
      //获取缩略图
      assets.getThumbnail((err,pixelMap)=>{
        if (err == undefined) {
          console.info('getThumbnail successful ' + JSON.stringify(pixelMap));
        } else {
          console.error('getThumbnail fail', err);
        }
      });
    } catch (error){
      console.error('uriGetAssets failed with err: ' + JSON.stringify(error));
    }
  }

  build() {
    Column(){
      if(this.previewImageUri != "")
        Image(this.previewImageUri)
          .width(100)
          .height(100)
          .margin({bottom:10})

      Button("getUriFormPhotoPicker")
        .onClick((ev)=>{
          this.getUriFormPhotoPicker()
        })
        .margin({bottom:10})
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}