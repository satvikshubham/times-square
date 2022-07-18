import { Calendar } from './Calendar'
import { DisplayOnlyCalendar } from './DisplayOnly'

@Entry
@Component
export struct DisplayOnlyModelCalendar {
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []
  indexArray: number [] = Array.apply(null, Array(23)).map(function (item, i) {
    return i
  })

  @State selectedDateFinal : [][] = []

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
            DisplayOnlyCalendar({
              month: this.monthArray[item],
              year: this.yearArray[item],
              selectedDateFinal: $selectedDateFinal
            })
          }
        })
      }
    }
  }
}