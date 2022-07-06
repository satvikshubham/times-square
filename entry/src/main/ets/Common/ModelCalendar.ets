import { Calendar } from './Calendar'
import { MonthGrid } from './MonthView'

@Entry
@Component
export struct ModelCalendar {
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  scroller: Scroller = new Scroller()
  monthArray: number[]
  yearArray: number []

  aboutToAppear() {
    var temp = Calendar.getCalendarForYear(this.currentMonth, this.currentYear)
    this.monthArray = temp.listOfMonths
    this.yearArray = temp.listOfYear
  }

  build() {
    Scroll(this.scroller) {
      Column({space: 10}) {
          ForEach(this.yearArray, (item, index) => {
            MonthGrid({
              month: this.monthArray[index],
              year: item
            })
          })
      }.padding(20)
    }.scrollable(ScrollDirection.Vertical)
  }
}