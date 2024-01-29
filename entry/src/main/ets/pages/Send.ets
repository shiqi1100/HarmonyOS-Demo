import router from '@ohos.router'
@Entry
@Component
struct Send {
  @State message: string = '我是send组件'
  @State src: string = router.getParams()?.['src']

  build() {
    Row() {
      Column() {
        Swiper() {
          Text('0')
            .width('100%')
            .height('50%')
            .textAlign(TextAlign.Center)
            .backgroundColor($r('app.color.green'))
          Text('1')
            .width('100%')
            .height('50%')
            .textAlign(TextAlign.Center)
            .backgroundColor($r('app.color.pink'))
          Text('2')
            .width('100%')
            .height('50%')
            .textAlign(TextAlign.Center)
            .backgroundColor($r('app.color.back'))
        }
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src)
        Button('返回')
          .margin({top: 20})
          .width(150)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}