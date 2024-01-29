import { useToast } from '../utils/toast'
import router from '@ohos.router'
PersistentStorage.PersistProp('aProp', 88);
@Entry
@Component
struct Login {
  @State message: string = '登录'
  @State account: string = ''
  @State password: string = ''
  @StorageLink('aProp') appLink: string = 'abc'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fs()
        TextInput({placeholder: '请输入账号'})
          .input()
          .onChange((value: string) => {
            this.account = value
          })
        TextInput({placeholder: '请输入密码'})
          .input()
          .type(InputType.Password)
          .margin({top:0,left:20,right:20})
          .onChange((value: string) => {
            this.password = value
          })
        Button(`登录 ${this.appLink}`)
          .width(330)
          .margin(20)
          .backgroundColor($r('app.color.main'))
          .onClick(() => {
            if (!this.account) {
              return useToast('请输入账号')
            } else if (!this.password) {
              return useToast('请输入密码')
            }
            router.pushUrl({url: 'pages/Index'})
          })
        Button(`Parent from localStorage ${this.appLink}`)
          .margin({top: 20})
          .width(350)
          .onClick(this.appLinkFn)
          .backgroundColor($r('app.color.main'))
      }
      .width('100%')
    }
    .height('100%')
  }
  appLinkFn = () => {
    this.appLink += 2
  }
}



@Extend(Text) function fs() {
  .fontSize(30)
  .fontColor(Color.Black)
}

@Extend(TextInput) function input() {
  .height(60)
  .margin(20)
}