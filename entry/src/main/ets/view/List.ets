
import { Data } from '../pages/ListPage'

@Component
export struct InfoList {
  @Link data: Data
  @Prop @Watch('onDataChange') count: number
  @State total: number = 0
  @LocalStorageLink('PropA') storeLinkB: number = 1;
  @LocalStorageProp('PropA') storeLinkC: number = 1;

  onDataChange(propName: string): void {
    this.total += this.count
  }
  build() {
    Row() {
      Column() {
        Text(this.data.title)
        Text('监听变化的值' + this.total.toString())
        Text('prop 值' + this.count.toString())
        Text(this.data.content)
          .fontColor('red')
          .margin(20)
        Button('子组件改变')
          .margin({top: 20})
          .backgroundColor($r('app.color.main'))
          .onClick(() => {
            this.data.title = '我再子组件被改变了'
          })
        Button(`Child from localStorage ${this.storeLinkB}`)
          .margin({top: 20})
          .width(350)
          .onClick(this.testLocal)
          .backgroundColor($r('app.color.main'))
        Button(`Child from localStorage Prop ${this.storeLinkC}`)
          .margin({top: 20})
          .width(350)
          .onClick(this.testLocal2)
          .backgroundColor($r('app.color.main'))
      }
    }
    .height('50%')
  }

  testLocal = () => {
    this.storeLinkB += 200
  }
  testLocal2 = () => {
    this.storeLinkC += 100
  }
}