export class ListItemData{
  name:string = ""
  action:VoidCallback = ()=>{}

  constructor(name:string,action:VoidCallback) {
    this.name = name
    this.action = action
  }
}