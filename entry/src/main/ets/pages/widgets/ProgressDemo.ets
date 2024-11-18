@Entry
@Component
struct ProgressDemo{
  @State currentProgressValue: number = 10
  maxProgressValue: number = 100
  build() {
    Column(){
      Progress({value: this.currentProgressValue, total: this.maxProgressValue,type: ProgressType.Linear})
      Progress({value: this.currentProgressValue, total: this.maxProgressValue,type: ProgressType.Capsule})
      Progress({value: this.currentProgressValue, total: this.maxProgressValue,type: ProgressType.Ring})
      Progress({value: this.currentProgressValue, total: this.maxProgressValue,type: ProgressType.Eclipse})
      Progress({value: this.currentProgressValue, total: this.maxProgressValue,type: ProgressType.ScaleRing})
        .style({scaleCount: 50,scaleWidth: 10})

      Slider({value:this.currentProgressValue,min:0,max: this.maxProgressValue,step: 1}).onChange((progress)=>{
        this.currentProgressValue = progress
      })
    }
  }
}