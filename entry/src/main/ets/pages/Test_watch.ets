import router from '@ohos.router'
@Entry
@Component
struct Test_watch {
  @State message: string = 'Hello World'
  @State status: boolean = false

  build() {
    Row() {
      Column({space: 8}) {
        Child({message: this.message})
        userButton('点击发送监听', () => { (this.message = '我被点击了') && (this.status = false) })
        userButton('Builder', () => {
          console.log('我是builder我被点击了')
          this.status = true
        })
        userButton('去商品列表', () => {
          this.status = true
          router.pushUrl({
            url: 'pages/GoodsList'
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Builder function userButton(title: string, fn: () => void) {
  Button(title)
    .width(300)
    .backgroundColor(this.status ? $r('app.color.main') : $r('app.color.pink'))
    .onClick(fn)
}

@Component
struct Child {
  @Prop @Watch('onchange') message: string
  @State useText: string = '初始的'
  onchange() {
    this.useText = this.message
  }
  build() {
    Text(this.useText)
      .fontColor(Color.Green)
  }
}