import { Keys, SizeProps } from '../@Framework'

//在harmony中貌似没有什么卵用
@Component
export struct SafeArea{
  @StorageProp(Keys.kNavigationBarHeight)
  navigationBarHeight:number = 0
  @StorageProp(Keys.kStatusBarHeight)
  statusBarHeight:number = 0

  @Builder doNothingBuilder(){}
  @BuilderParam builder:()=>void = this.doNothingBuilder

  build() {

    Column(){
      this.builder()
    }
    .padding({top:px2vp(this.statusBarHeight),bottom:px2vp(this.navigationBarHeight)})
    .width(SizeProps.MATCH_CONTENT)
    .height(SizeProps.MATCH_CONTENT)

  }
}