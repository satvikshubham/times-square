import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'
import { DATE } from './DATE'

@Component
export struct RangeSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: number [] = []
  inMonthArray: boolean []= []
  @Link rangeOfDates: number [][]
  startDate: DATE = new DATE()
  endDate: DATE = new DATE()

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
  }

  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  textSize: number | string | Resource = '14fp'

  isCorrect = (startDate: DATE, endDate: DATE): boolean => {
    let sDate = new Date(startDate.getYear(), startDate.getMonth(), startDate.getDay())
    let eDate = new Date(endDate.getYear(), endDate.getMonth(), endDate.getDay())
    if (sDate > eDate) {
      return false;
    }
    else {
      return true
    }
  }
  push = (date: DATE): void => {
    let d = date.getDate()
    if (this.rangeOfDates.length == 0) {
      this.rangeOfDates.push(d)
    }
    else {
      if (this.rangeOfDates.length == 1) {
        let startDate: DATE = new DATE(this.rangeOfDates[0][0], this.rangeOfDates[0][1], this.rangeOfDates[0][2])
        if (this.isCorrect(startDate, date)) {
          let tempStart: Date = new Date(this.rangeOfDates[0][2], this.rangeOfDates[0][1], this.rangeOfDates[0][0])
          let tempEnd : Date = new Date(date.getYear(),date.getMonth(),date.getDay())
          tempStart.setDate(tempStart.getDate() +1)
          const d = new Date(tempStart.getTime())
          while (d <= tempEnd) {
            this.rangeOfDates.push([d.getDate(), d.getMonth() , d.getFullYear()]);
            d.setDate(d.getDate() + 1);
          }
        }
        else {
          this.rangeOfDates.pop()
          this.rangeOfDates.push([date.getDay(),date.getMonth(), date.getYear()])
        }
      }
      else{
        this.rangeOfDates = []
        this.rangeOfDates.push(date.getDate())
      }
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
              month: this.month - 1,
              year: this.year,
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
              selectedDate: $rangeOfDates,
            })
          }.padding('2vp')
          .onClick(() => {
            let d: DATE = new DATE(item, this.month - 1, this.year)
            this.push(d)
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}