import { Calendar } from './Calendar'
import { MultiSelectCalendar } from './MultiSelect'

@Entry
@Component
export struct MultiSelectModelCalendar {
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []

  indexArray: number [] = Array.apply(null, Array(23)).map(function (item, i) {
    return i
  })
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
            MultiSelectCalendar({
              month: this.monthArray[item],
              year: this.yearArray[item],
//              sDates: this.selectedDates
            })
          }
        })
      }
    }.padding('20vp')
  }
}