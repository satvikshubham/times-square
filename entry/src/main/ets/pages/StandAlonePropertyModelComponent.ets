//Stand Alone Property
@Entry
@Component
struct App {
  private attNum : number = 20
  build() {
    Column() {
      StandAloneComponent({attNum: this.attNum})
    }
  }
}

@Component
struct StandAloneComponent {
  private attNum : number = undefined
  @State private model : Model = undefined

  aboutToAppear() {
    if (this.model == undefined) {
      this.model = new Model(this.attNum);
    }
  }

  build() {
    Text(this.model.getNumber() + "")
      .fontSize(30)
      .onClick(() => {
        this.model.setNumber(this.model.getNumber()+1)
      })
  }
}


class Model {
  private num? : number = 10

  constructor(y?) {
    if (y) {
      this.num = y
    }
  }
  setNumber(x) {
    if (x != undefined) {
      this.num = x
    }
  }
  getNumber() {
    return this.num
  }
}
