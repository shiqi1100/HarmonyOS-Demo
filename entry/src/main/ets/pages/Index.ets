import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Hello HarmonyOS'
  @State text: string = ''
  @StorageLink('aProp') appLink: number = 0
  build() {
    Row() {
      RelativeContainer() {
        Image($r('app.media.img'))
          .width(350)
          .height(200)
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start}
          })
          .id("image")
      }
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .borderStyle(BorderStyle.Dashed)
        TextInput({placeholder: '请输入'})
          .height(50)
          .width('90%')
          .margin(20)
          .onChange(value => {
            this.text = value
          })
        Text(this.text)
          .padding(20)
        Text(this.appLink.toString())
        Button('点击跳转')
          .onClick(this.goPage)
          .width(330)
          .backgroundColor($r('app.color.main'))
        Button('去列表页')
          .onClick(this.goListPage)
          .margin({top: 20})
          .width(330)
          .backgroundColor($r('app.color.main'))
        Button('去测试watch')
          .onClick(this.testWatch)
          .margin({top: 20})
          .width(330)
          .backgroundColor($r('app.color.main'))
      }
      .width('100%')
    }
    .height('100%')
  }

  goPage = () => {
    router.pushUrl({
      url: 'pages/Send',
      params: {
        src: '我是传参'
      }
    })
  }
  goListPage = () => {
    router.pushUrl({
      url: 'pages/ListPage'
    })
  }
  testWatch = () => {
    router.pushUrl({
      url: 'pages/Test_watch'
    })
  }
}