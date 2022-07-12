import { Calendar } from './Calendar'
import { RangeSelectCalendar } from './RangeSelect'

@Entry
@Component
export struct RangeSelectModelCalendar {
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
            RangeSelectCalendar({
              month: this.monthArray[item],
              year: this.yearArray[item]
            })
          }
        })
      }
    }.padding('20vp')
  }
}