@Component
@Entry
export struct CalendarCellView {
  @State date: number = 0
  // To be decided later
  dayIcon: Resource
  textSize : number = 20
  inMonthColor: string = "#ebf5ef"
  notInMonthColor: string = "#d0d9d4"
  inMonthTextColor: string = "#303133"
  notInMonthTextColor: string = "#787a7d"
  inMonth: boolean = true
  isCustom : boolean = false

  getBackgroundColor = (inMonth: boolean): string => {
    if (inMonth) {
      return this.inMonthColor
    }
    else {
      return this.notInMonthColor
    }
  }
  getTextColor = (inMonth: boolean): string => {
    if (inMonth) {
      return this.inMonthTextColor
    }
    else {
      return this.notInMonthTextColor
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.date.toString()).fontSize(this.textSize).fontColor(this.getTextColor(this.inMonth))
        Image(this.dayIcon).height(10).width(10)
      }
      .width('100%').backgroundColor(this.getBackgroundColor(this.inMonth))
    }
    .height('90%').backgroundColor(this.getBackgroundColor(this.inMonth))
  }
}