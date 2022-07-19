import { Calendar } from './Calendar'
import { SingleSelectCalendar } from './SingleSelect'

@Entry
@Component
export struct SingleSelectModelCalendar {
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []
  indexArray: number [] = Array.apply(null, Array(23)).map(function (item, i) {
    return i
  })

  @State selectedDateFinal : number[][] = []

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
            SingleSelectCalendar({
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