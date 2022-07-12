import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'

@Entry
@Component
export struct RangeSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  @State startDate: Date = new Date()
  @State endDate: Date = new Date()
  @State startSelected: boolean = false
  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  textSize: number | string | Resource = '14fp'
  @State rangeOfDates: number [][] = []

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
  }

  isCorrect = (sDate: Date, eDate: Date): boolean => {
    if (sDate < eDate) {
      return true
    }
    else {
      return false
    }
  }
  getDays = (sDate: Date, eDate: Date): number[][] => {
    if (this.isCorrect(sDate, eDate)) {
      const date = new Date(sDate.getTime())
      const dates: number [][] = []
      while (date <= eDate) {
        dates.push([date.getDate(), date.getMonth(), date.getFullYear()]);
        date.setDate(date.getDate() + 1);
      }
      return dates
    }
    else {
      return []
    }
  }

  build() {
    Column() {
      Text(this.months[this.month-1] + " " + this.year).fontSize(this.textSize).alignSelf(ItemAlign.Start)
        .fontWeight(FontWeight.Bolder)
      Grid() {
        ForEach(this.weekDays, (item) => {
          GridItem() {
            Text(item).fontSize(this.textSize)
          }
        })
        ForEach(this.monthDays, (item, index) => {
          GridItem() {
            CalendarCellView({
              date: item,
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
            })
          }.padding('2vp')
          .onClick(() => {
            console.log(item)
            if (!this.startSelected) {
              this.startDate = new Date(this.year, this.month - 1, item)
              this.startSelected = true;
            }
            if (this.startSelected) {
              this.endDate = new Date(this.year, this.month - 1, item)
            }
            if (this.isCorrect(this.startDate, this.endDate)) {
              let validDays: number [][] = this.getDays(this.startDate, this.endDate)
              for (let i = 0;i < validDays.length; i++) {
                this.rangeOfDates.push([validDays[i][0], validDays[i][1], validDays[i][2]])
              }
            }
            else {
              this.startDate = this.endDate
              this.endDate = undefined
            }
            console.log(this.rangeOfDates.toString())
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}