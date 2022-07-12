@Component
@Entry
export struct CalendarCellView {
  @State date: number = 0
  // To be decided later
  dayIcon: Resource
  textSize: number | string | Resource = '20fp'
  inMonthColor: ResourceColor = "#ebf5ef"
  notInMonthColor: ResourceColor = "#d0d9d4"
  inMonthTextColor: ResourceColor = "#303133"
  notInMonthTextColor: ResourceColor = "#787a7d"
  inMonth: boolean = true
  isCustom: boolean = false
  selectedDate: number | number []  = 0
  selectedTextColor: ResourceColor  = "#fafafa"
  selectedBackgroundColor: ResourceColor= "#3a4352"
  getBackgroundColor = (date: number): ResourceColor => {
    if (typeof (this.selectedDate) === 'number') {
      if (this.inMonth) {
        if (this.selectedDate != 0 && this.selectedDate == date) {
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
    else {
      if (this.inMonth) {
        if (this.selectedDate.length != 0 && this.selectedDate.find(x => x == date) != undefined) {
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
  }
  getTextColor = (date: number): ResourceColor => {
    if (typeof (this.selectedDate) === 'number') {
      if (this.inMonth) {
        if (this.selectedDate != 0 && this.selectedDate == date) {
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
    else {
      if (this.inMonth) {
        if (this.selectedDate.length != 0 && this.selectedDate.find(x => x == date) != undefined) {
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
  }

  build() {
    Row() {
      Column() {
        Text(this.date.toString()).fontSize(this.textSize).fontColor(this.getTextColor(this.date))
        Image(this.dayIcon).height('10vp').width('10vp')
      }
      .width('100%').backgroundColor(this.getBackgroundColor(this.date))
    }
    .height('90%').backgroundColor(this.getBackgroundColor(this.date))
  }
}