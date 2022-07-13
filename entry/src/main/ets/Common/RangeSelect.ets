import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'

@Entry
@Component
export struct RangeSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  @State startDate: Date = undefined
  @State endDate: Date = undefined
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
    if (sDate == undefined || eDate == undefined) {
      return false
    }
    if (sDate < eDate) {
      return true
    }
    else {
      return false
    }
  }
  getDays = (sDate: Date, eDate: Date): number[][] => {
    if (this.isCorrect(sDate, eDate)) {
      sDate.setDate(sDate.getDate() + 1)
      const date = new Date(sDate.getTime())
      const dates: number [][] = []
      while (date <= eDate) {
        dates.push([date.getDate(), date.getMonth()+1, date.getFullYear()]);
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
              month: this.month -1,
              year : this.year,
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
              selectedDate: this.rangeOfDates
            })
          }.padding('2vp')
          .onClick(() => {
            console.log(item)
            if (!this.startSelected) {
              this.rangeOfDates = []
              this.startDate = new Date(this.year, this.month -1, item)
              this.startSelected = true
              this.rangeOfDates.push([item, this.month -1, this.year])
            }
            else if (this.startSelected) {
              this.endDate = new Date(this.year, this.month -1, item)
              if (this.isCorrect(this.startDate, this.endDate)) {
                let validDays = this.getDays(this.startDate, this.endDate)
                for (let i = 0; i < validDays.length; i++) {
                  this.rangeOfDates.push([validDays[i][0], validDays[i][1]-1, validDays[i][2]])
                }
                this.startSelected = false
              }
              else{
                this.startDate = this.endDate
                this.rangeOfDates = []
                this.rangeOfDates.push([item, this.month -1, this.year])
              }
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