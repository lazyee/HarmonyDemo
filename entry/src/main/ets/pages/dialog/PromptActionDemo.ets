import { ComponentContent } from '@kit.ArkUI'
import { SizeProps } from '../../framework/@Framework'
import { promptActionCustomGlobalDialogBuilder, PromptActionParam } from './GlobalCustomDialog'

@Entry
@Component
struct PromptActionDemo{
  private ctx: UIContext = this.getUIContext()
  private contentNode: ComponentContent<object> = new ComponentContent(this.ctx,wrapBuilder(promptActionCustomGlobalDialogBuilder),new PromptActionParam("harmony垃圾","垃圾垃圾",()=>{
    this.ctx.getPromptAction().closeCustomDialog(this.contentNode)
  },()=>{
    this.ctx.getPromptAction().closeCustomDialog(this.contentNode)
  }))

  build() {
    Column(){
      Button("PromptAction show").onClick((ev)=>{
        this.ctx.getPromptAction().openCustomDialog(this.contentNode)
      })

      Button("PromptAction contentNode update").onClick((ev)=>{
        this.contentNode.update(new PromptActionParam("更加垃圾了","垃圾到起飞",()=>{
          this.ctx.getPromptAction().closeCustomDialog(this.contentNode)
        },()=>{
          this.ctx.getPromptAction().closeCustomDialog(this.contentNode)
        }))
      })
    }
    .width(SizeProps.FULL_WINDOW)
    .height(SizeProps.FULL_WINDOW)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

}