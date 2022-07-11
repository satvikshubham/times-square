import { CalendarCellView } from './CalendarCellView'
import { Calendar } from './Calendar'

@Entry
@Component
export struct RangeSelectCalendar {
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  @State startDate: Date = new Date()
  @State endDate: Date = new Date()
  @State startSelected: boolean = false
  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  textSize: number | string | Resource = '14fp'

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
  }

  isCorrect = (sDate : Date, eDate : Date) : boolean => {
    if (sDate< eDate){
      return true
    }
    else{
      return false
    }
  }
  getDays = (sDate : Date, eDate : Date) : number[] => {
    if (this.isCorrect(sDate,eDate)){
      
    }
    else{
      return []
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
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
            })
          }.padding('2vp')
          .onClick(() => {
            console.log(item)
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr ')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .width('100%').height('300vp')
    }.padding({ bottom: '10vp' })
  }
}