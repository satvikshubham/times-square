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
  indexArray: number [] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
  , 15, 16, 17, 18, 19, 20, 21, 22, 23]

  aboutToAppear() {
    var temp = Calendar.getCalendarForYear(this.currentMonth, this.currentYear)
    this.monthArray = temp.listOfMonths
    this.yearArray = temp.listOfYear
  }

  build() {
    Column() {
      List({ initialIndex: 13 }) {
        ForEach(this.indexArray, (item) => {
          ListItem() {
            MonthGrid({
              month: this.monthArray[item],
              year: this.yearArray[item]
            })
          }
        })
      }
    }.padding(20)
  }
}