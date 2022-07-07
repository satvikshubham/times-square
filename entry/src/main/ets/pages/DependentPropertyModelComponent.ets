//Dependent Property
@Entry
@Component
struct App {
  @State attNum : number = 20
  build() {
    Column() {
      DependentComponent({attNum: $attNum})
    }
    .onClick(() => {
      this.attNum = this.attNum + 1
    })
  }
}

@Component
struct DependentComponent {
  @Link @Watch("updateAttrNum") attNum : number
  @State private model : Model = undefined

  aboutToAppear() {
    if (this.model == undefined) {
      this.model = new Model(this.attNum);
    }
  }

  build() {
    Text(this.model.getNumber() + "")
    .fontSize(30)
  }

  updateAttrNum() {
    this.model.setNumber(this.attNum)
  }

}


class Model {
  private num? : number = 10

  constructor(y?) {
    this.setNumber(y)
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
