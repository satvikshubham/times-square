import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'
import { DATE } from './DATE'

@Component
export struct SingleSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  @Link selectedDateFinal: number [][]
  dateSelected: DATE = new DATE()

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

  setDate = (d: number []): void => {
    this.dateSelected.setDate(d[0], d[1], d[2])
  }

  push = (): void => {
    if (this.selectedDateFinal.length == 0) {
      this.selectedDateFinal.push(this.dateSelected.getDate())
    }
    else {
      this.selectedDateFinal.pop()
      this.selectedDateFinal.push(this.dateSelected.getDate())
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
              selectedDate: $selectedDateFinal
            })
          }.padding('2vp')
          .onClick(() => {
            this.setDate([item, this.month - 1, this.year])
            this.push()
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}