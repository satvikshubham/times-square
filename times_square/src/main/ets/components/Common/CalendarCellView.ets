@Component
export struct CalendarCellView {
  date: number = 0
  month: number = 0
  year: number = 0
  d: number [] = []
  @Link selectedDate: number [][]

  // Attributes
  dayIcon: Resource
  textSize: number | string | Resource = '20fp'
  inMonthColor: ResourceColor = "#ebf5ef"
  notInMonthColor: ResourceColor = "#d0d9d4"
  inMonthTextColor: ResourceColor = "#303133"
  notInMonthTextColor: ResourceColor = "#787a7d"
  selectedTextColor: ResourceColor  = "#fafafa"
  selectedBackgroundColor: ResourceColor= "#3a4352"
  gridShape: string = "Square"
  gridRadius: string = '0vp'

  // Logic
  inMonth: boolean = true
  isCustom: boolean = false

  aboutToAppear() {
    this.d.push(this.date)
    this.d.push(this.month)
    this.d.push(this.year)
    if (this.gridShape === "Circle") {
      this.gridRadius = '20vp'
    }
  }

  getBackgroundColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDate.length != 0 && this.selectedDate.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.selectedBackgroundColor
      }
      else {
        return this.inMonthColor
      }
    }
    else {
      return this.notInMonthColor
    }
  }
  
  getTextColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDate.length != 0 && this.selectedDate.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.selectedTextColor
      }
      else {
        return this.inMonthTextColor
      }
    }
    else {
      return this.notInMonthTextColor
    }
  }

  build() {
    if (this.selectedDate.length >= 0) {
      Row() {
        Column() {
          Text(this.date.toString()).fontSize(this.textSize).fontColor(this.getTextColor(this.d))
          Image(this.dayIcon).height('10vp').width('10vp')
        }
        .width('100%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.gridRadius)
      }
      .height('90%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.gridRadius)
    }
  }
}