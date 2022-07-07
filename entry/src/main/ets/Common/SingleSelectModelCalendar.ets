import { Calendar } from './Calendar'
import { SingleSelectCalendar } from './SingleSelect'

@Entry
@Component
export struct SingleSelectModelCalendar {
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  scroller: Scroller = new Scroller()
  monthArray: number[]
  yearArray: number []
  //  indexArray: number [] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
  //  , 15, 16, 17, 18, 19, 20, 21, 22, 23]
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
            SingleSelectCalendar({
              month: this.monthArray[item],
              year: this.yearArray[item]
            })
          }
        })
      }
    }.padding(20)
  }
}