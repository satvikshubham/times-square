import { CalendarCellView } from './CalendarCellView'
import { DATE } from './DATE'
import { Calendar }from './Calendar'

@Entry
@Component
export struct CalendarMainModel {
  typeOfCalendar: string = "Dialog"
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []
  indexArray: number [] = Array.apply(null, Array(23)).map(function (item, i) {
    return i
  })
  @State selectedDateFinal: number[][] = []

  dialogBoxController: CustomDialogController = new CustomDialogController({
    builder: DialogBoxComponent({}),
    autoCancel: true
  })

//  list of attributes
  bgColor : ResourceColor = "#FFFFFF"
  textSize: number | string  = '14fp'
  monthTextColor : ResourceColor = "#000000"
  monthTextSize : number | string  =  '14fp'
  dayIcon: Resource
  textSize: number | string | Resource = '20fp'
  inMonthColor: ResourceColor = "#ebf5ef"
  notInMonthColor: ResourceColor = "#d0d9d4"
  inMonthTextColor: ResourceColor = "#303133"
  notInMonthTextColor: ResourceColor = "#787a7d"
  selectedTextColor: ResourceColor  = "#fafafa"
  selectedBackgroundColor: ResourceColor= "#3a4352"
  gridShape: string = "Square"
  gridRadius: string = '0vp'

  aboutToAppear() {
    var temp = Calendar.getCalendarForYear(this.currentMonth, this.currentYear)
    this.monthArray = temp.listOfMonths
    this.yearArray = temp.listOfYear
    if (this.typeOfCalendar==="Dialog"){
      this.dialogBoxController.open()
    }
  }

  build() {
    Column() {
      List({ initialIndex: 13 }) {
        ForEach(this.indexArray, (item) => {
          ListItem() {
            Month({
              month: this.monthArray[item],
              year: this.yearArray[item],
              selectedDateFinal: $selectedDateFinal,
              typeOfCalendar: this.typeOfCalendar
            })
          }
        })
      }
    }.backgroundColor(this.bgColor)
  }
}

@Component
struct Month {
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  @Link selectedDateFinal: number [][]
  typeOfCalendar: string = "Single"
  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  
  // Attributes
  textSize: number | string  = '14fp'
  monthTextColor : ResourceColor = "#000000"
  monthTextSize : number | string  =  '14fp'
  dayIcon: Resource
  textSize: number | string | Resource = '20fp'
  inMonthColor: ResourceColor = "#ebf5ef"
  notInMonthColor: ResourceColor = "#d0d9d4"
  inMonthTextColor: ResourceColor = "#303133"
  notInMonthTextColor: ResourceColor = "#787a7d"
  selectedTextColor: ResourceColor  = "#fafafa"
  selectedBackgroundColor: ResourceColor= "#3a4352"
  gridShape: string = "Square"
  gridRadius: string = '0vp'


  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
  }

  isCorrect = (startDate: DATE, endDate: DATE): boolean => {
    let sDate = new Date(startDate.getYear(), startDate.getMonth(), startDate.getDay())
    let eDate = new Date(endDate.getYear(), endDate.getMonth(), endDate.getDay())
    if (sDate > eDate) {
      return false;
    }
    else {
      return true
    }
  }
  push = (date: DATE): void => {
    if (this.typeOfCalendar === "Single") {
      if (this.selectedDateFinal.length == 0) {
        this.selectedDateFinal.push(date.getDate())
      }
      else {
        this.selectedDateFinal.pop()
        this.selectedDateFinal.push(date.getDate())
      }
    }
    if (this.typeOfCalendar === "Multi") {
      let d = date.getDate()
      let ind = this.selectedDateFinal.findIndex(x => x[0] == d[0] && x[1] == d[1] && x[2] == d[2])
      if (ind != -1) {
        this.selectedDateFinal.splice(ind, 1)
      }
      else {
        this.selectedDateFinal.push(d)
      }
    }
    if (this.typeOfCalendar === "Range") {
      let d = date.getDate()
      if (this.selectedDateFinal.length == 0) {
        this.selectedDateFinal.push(d)
      }
      else {
        if (this.selectedDateFinal.length == 1) {
          let startDate: DATE = new DATE(this.selectedDateFinal[0][0], this.selectedDateFinal[0][1], this.selectedDateFinal[0][2])
          if (this.isCorrect(startDate, date)) {
            let tempStart: Date = new Date(this.selectedDateFinal[0][2], this.selectedDateFinal[0][1], this.selectedDateFinal[0][0])
            let tempEnd: Date = new Date(date.getYear(), date.getMonth(), date.getDay())
            tempStart.setDate(tempStart.getDate() + 1)
            const d = new Date(tempStart.getTime())
            while (d <= tempEnd) {
              this.selectedDateFinal.push([d.getDate(), d.getMonth(), d.getFullYear()]);
              d.setDate(d.getDate() + 1);
            }
          }
          else {
            this.selectedDateFinal.pop()
            this.selectedDateFinal.push([date.getDay(), date.getMonth(), date.getYear()])
          }
        }
        else {
          this.selectedDateFinal = []
          this.selectedDateFinal.push(date.getDate())
        }
      }
    }
    if (this.typeOfCalendar === "DisplayOnly"){

    }

  }

  build() {
    Column() {
      Text(this.months[this.month-1] + " " + this.year).fontSize(this.monthTextSize).alignSelf(ItemAlign.Start)
        .fontColor(this.monthTextColor)
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
              month: this.month - 1,
              year: this.year,
              textSize: '15fp',
              inMonth: this.inMonthArray[index],
              selectedDate: $selectedDateFinal,
            })
          }.padding('2vp')
          .onClick(() => {
            let d: DATE = new DATE(item, this.month - 1, this.year)
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

@CustomDialog
struct DialogBoxComponent {
  controller: CustomDialogController
  cancel: () => void
  okay: () => void
  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        CalendarMainModel({
          typeOfCalendar: "Single"
        })
        Row() {
          Button({ type: ButtonType.Normal }) {
            Text("Dismiss").fontColor('#FFFFFF').fontSize('20fp')
          }.onClick(()=>{
            this.controller.close()
          })
          .width('100vp')
          .backgroundColor("#544343")
          .shadow({radius:3})
        }.backgroundColor("#FFFFFF").width('100%').height('60vp')
      }
    }.padding('20vp')
  }
}