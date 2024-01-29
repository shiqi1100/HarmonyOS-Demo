import { InfoList } from '../view/List'
import getHttpData from '../utils/http'

let storage = new LocalStorage({ 'PropA': 47 });


export class Data {
  title: string
  content: string
  constructor(title?: string, content?: string) {
    this.title = title
    this.content = content
  }
}

interface ReqType {
  name: string
  from: string
}
@Entry(storage)
@Component
struct ListPage {
  @State sendData: Data = new Data('自定义标题', '自定义内容')
  @State reqDataList: ReqType[] = []
  @State count: number = 1
  @LocalStorageLink('PropA') storeLinkA: number = 1
  aboutToAppear() {
    this.initList()
  }
  build() {
    Row() {
      Column() {
        Text('我是listPage页面')
        InfoList({data: $sendData, count: this.count})
        Button(this.count.toString() + '子组件监听')
          .onClick(() => {
            this.count++
          })
        Text(this.sendData.title)
          .fontColor('green')
        List() {
          ForEach(this.reqDataList, (item) => {
            ListItem() {
              Row() {
                Column() {
                  Text(item.name)
                    .fontSize(20)
                }
                  .width('100%')
              }
            }
          })
        }
        .margin({top: 20})
        Button('点击获取数据')
          .margin({top: 20})
          .width(350)
          .onClick(this.initList)
          .backgroundColor($r('app.color.main'))
        Button(`Parent from localStorage ${this.storeLinkA}`)
          .margin({top: 20})
          .width(350)
          .onClick(this.testLocal)
          .backgroundColor($r('app.color.main'))
      }
      .width('100%')
    }
  }
  initList = () => {
    getHttpData().then(({result}) => {
      if (result) {
        this.reqDataList = [result]
      }
    })
  }

  testLocal = () => {
    this.storeLinkA += 1
  }
}