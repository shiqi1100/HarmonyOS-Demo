import { Header } from '../view/header'
@Entry
@Component
struct GoodsList {
  @State message: string = 'Hello World'
  @State itemText: Object[] = [
    {
      imgUrl: $r('app.media.icon'),
      titleName: '商品1',
      price: '$6499',
      priceLow: '$5899',
      subsidy: '$500'
    },
    {
      imgUrl: $r('app.media.icon'),
      titleName: '商品2',
      price: '$6499',
      priceLow: '$5899',
      subsidy: '$500'
    },
    {
      imgUrl: $r('app.media.icon'),
      titleName: '商品3',
      price: '$6499',
      priceLow: '$5899',
      subsidy: '$500'
    },
    {
      imgUrl: $r('app.media.icon'),
      titleName: '商品4',
      price: '$6499',
      priceLow: '$5899',
      subsidy: '$500'
    },
  ]
  build() {
    Row() {
      Column() {
        Header({title: '商品列表'}).margin({bottom: 20})
          .alignSelf(ItemAlign.Start)
        Scroll() {
          Column() {
            ForEach(this.itemText, (item) => {
              itemBuilder(item)
            })
          }.margin({bottom: 20})
        }
        .scrollBarWidth(0)
      }
      .height('100%')
    }
    .padding(30)
    .backgroundColor('#e5fbff')
    .height('100%')
    .width('100%')
  }
}

@Builder function itemBuilder(item) {
  Flex({direction: FlexDirection.Row}) {
    Row() {
      Image(item.imgUrl).width(100).margin({right: 20})
    }
    Flex({direction: FlexDirection.Column}) {
      Text(item.titleName).fontSize(20)
      Text('原价：' + item.price).fontColor(Color.Gray).margin({top: 8})
      Text('折扣价：' + item.priceLow).fontColor(Color.Red).margin({top: 8})
      Text('补贴：' + item.subsidy).fontColor(Color.Red).margin({top: 8})
    }
  }
  .backgroundColor('#fff')
  .width('100%')
  .padding(30)
  .height(170)
  .margin({bottom: 20})
  .borderRadius(20)
}