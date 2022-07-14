import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'
import { DATE } from './DATE'

@Component
export struct MultiSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: number [] = []
  inMonthArray: boolean []= []
  @Link selectedDatesFinal: number [][]
  dateSelected : DATE = new DATE()

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

  push = (date : DATE): void => {
    let d = date.getDate()
    let ind = this.selectedDatesFinal.findIndex(x => x[0] == d[0] && x[1] == d[1] && x[2] == d[2])
    if (ind != -1){
      console.log(ind + "")
      this.selectedDatesFinal.splice(ind,1)
    }
    else{
      this.selectedDatesFinal.push(d)
    }
    console.log(JSON.stringify(this.selectedDatesFinal))
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
              month : this.month-1,
              year : this.year,
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
              selectedDate: $selectedDatesFinal
            })
          }.padding('2vp')
          .onClick(() => {
            let d = new DATE()
            d.setDate(item, this.month-1, this.year)
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