@Component
export struct Header {
  @Prop title: string

  build() {
    Row() {
      Text(this.title)
        .handlerHeaderStyle()
    }
  }
}

@Extend(Text) function handlerHeaderStyle() {
  .fontSize(30)
  .fontWeight(700)
}