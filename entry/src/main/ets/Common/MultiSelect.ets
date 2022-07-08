import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'

@Entry
@Component
export struct MultiSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: number [] = []
  inMonthArray: boolean []= []
  @State selectedDate: number = 0
  private sDates : Set<number> = new Set()

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
    this.sDates = new Set()
  }

  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  textSize: number | string | Resource = '14fp'

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
              selectedDate: this.selectedDate
            })
          }.padding(2)
          .onClick(() => {
            console.log(typeof(item))
            console.log(item.toString())
            this.sDates.add(20)
//            console.log(JSON.stringify(this.sDates))
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}