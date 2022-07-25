/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CalendarCellView } from './CalendarCellView'
import { DATE } from './DATE'
import { Calendar }from './Calendar'

@Entry
@Component
export struct CalendarMainModel {
  @State selectedDateFinal: number[][] = []
  currentMonth = new Date().getMonth()
  currentYear = new Date().getFullYear()
  monthArray: number[]
  yearArray: number []
  indexArray: number [] = Array.apply(null, Array(23)).map(function (item, i) {
    return i
  })
  tsTypeOfCalendar: string = "Single"
  tsIsDialog: boolean = false
  tsBgColor: ResourceColor = "#FFFFFF"
  tsGridTextSize: number | string  = '14fp'
  tsMonthTextSize: number | string  = '14fp'
  tsMonthTextColor: ResourceColor = "#000000"
  tsSelectedTextColor: ResourceColor  = "#fafafa"
  tsSelectedGridBackgroundColor: ResourceColor= "#3a4352"
  tsNotInMonthTextColor: ResourceColor = "#787a7d"
  tsInMonthColor: ResourceColor = "#ebf5ef"
  tsNotInMonthColor: ResourceColor = "#d0d9d4"
  tsInMonthTextColor: ResourceColor = "#303133"
  tsSetSelection: boolean = true
  tsWithNumbers: boolean = true
  tsLanguage: string = "English"
  tsGridShape: string = "Square"
  tsDayIcon: Resource = $r('app.string.page_show')

  dialogBoxController: CustomDialogController = new CustomDialogController({
    builder: DialogBoxComponent({
      tsTypeOfCalendar: this.tsTypeOfCalendar,
      tsGridTextSize: this.tsGridTextSize,
      tsMonthTextSize: this.tsMonthTextSize,
      tsMonthTextColor: this.tsMonthTextColor,
      tsSelectedTextColor: this.tsSelectedTextColor,
      tsSelectedGridBackgroundColor: this.tsSelectedGridBackgroundColor,
      tsNotInMonthTextColor: this.tsNotInMonthTextColor,
      tsInMonthColor: this.tsInMonthColor,
      tsNotInMonthColor: this.tsNotInMonthColor,
      tsInMonthTextColor: this.tsInMonthTextColor,
      tsSetSelection: this.tsSetSelection,
      tsWithNumbers: this.tsWithNumbers,
      tsLanguage: this.tsLanguage,
      tsGridShape: this.tsGridShape,
      tsDayIcon: this.tsDayIcon
    }),
    autoCancel: true,
  })

  aboutToAppear() {
    var temp = Calendar.getCalendarForYear(this.currentMonth, this.currentYear)
    this.monthArray = temp.listOfMonths
    this.yearArray = temp.listOfYear
    if (this.tsIsDialog) {
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
              tsTypeOfCalendar : this.tsTypeOfCalendar,
              selectedDateFinal: $selectedDateFinal,
              tsGridTextSize: this.tsGridTextSize,
              tsMonthTextSize: this.tsMonthTextSize,
              tsMonthTextColor: this.tsMonthTextColor,
              tsSelectedTextColor: this.tsSelectedTextColor,
              tsSelectedGridBackgroundColor: this.tsSelectedGridBackgroundColor,
              tsNotInMonthTextColor: this.tsNotInMonthTextColor,
              tsInMonthColor: this.tsInMonthColor,
              tsNotInMonthColor: this.tsNotInMonthColor,
              tsInMonthTextColor: this.tsInMonthTextColor,
              tsSetSelection: this.tsSetSelection,
              tsWithNumbers: this.tsWithNumbers,
              tsLanguage: this.tsLanguage,
              tsGridShape: this.tsGridShape,
              tsDayIcon: this.tsDayIcon
            })
          }
        })
      }
    }.backgroundColor(this.tsBgColor)
  }
}

@Component
struct Month {
  @Link selectedDateFinal: number [][]
  year: number = 2021
  month: number = 6
  monthDays: string [] = []
  inMonthArray: boolean []= []
  months: string [] = ["January", "February",
  "March", "April", "May", "June", "July", "August",
  "September", "October", "November", "December"]
  weekDays: string [] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  tsDayIcon: Resource
  tsTypeOfCalendar : string = "Single"
  tsGridTextSize: number | string  = '14fp'
  tsMonthTextSize: number | string  = '16fp'
  tsMonthTextColor: ResourceColor = "#000000"
  tsSelectedGridBackgroundColor: ResourceColor= "#3a4352"
  tsInMonthColor: ResourceColor = "#ebf5ef"
  tsNotInMonthColor: ResourceColor = "#d0d9d4"
  tsSelectedTextColor: ResourceColor  = "#fafafa"
  tsInMonthTextColor: ResourceColor = "#303133"
  tsNotInMonthTextColor: ResourceColor = "#787a7d"
  tsSetSelection: boolean = true
  tsWithNumbers: boolean = true
  tsLanguage: string = "English"
  tsGridShape: string = "Square"
  replaceNumberWithArabic = (num: number): string => {
    let arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    let k = ""
    let fd = num % 10
    let sd = Math.floor(num / 10)
    if (sd > 0) {
      k += arabic[sd]
    }
    k += arabic[fd]
    return k;
  }
  rotateAfterEvery7th = (arr: any[]): any[] => {
    for (let i = 0; i < arr.length; i = i + 7) {
      [arr[i + 0], arr[i + 6]] = [arr[i + 6], arr[i + 0]];
      [arr[i + 1], arr[i + 5]] = [arr[i + 5], arr[i + 1]];
      [arr[i + 2], arr[i + 4]] = [arr[i + 4], arr[i + 2]];
    }
    return arr;
  }

  aboutToAppear() {
    var temp = Calendar.getDaysArray(this.year, this.month)
    this.monthDays = temp.days
    this.inMonthArray = temp.inMonthArray
    if (this.tsLanguage === "Arabic") {
      if (!this.tsWithNumbers) {
        for (let i = 0; i < this.monthDays.length; i++) {
          this.monthDays[i] = this.replaceNumberWithArabic(+this.monthDays[i])
        }
      }
      this.weekDays = ['السبت', 'الجمعه', 'الخميس', 'الأربعاء', 'الثلاثاء', 'الأثنين', 'الأحد']
      this.monthDays = this.rotateAfterEvery7th(this.monthDays)
      this.inMonthArray = this.rotateAfterEvery7th(this.inMonthArray)
      this.months = ['يناير',
      'فبراير',
      'مارس',
      'إبريل',
      'مايو',
      'يونيه',
      'يوليه',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر']
    }
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
    if (this.tsSetSelection) {
      if (this.tsTypeOfCalendar === "Single") {
        if (this.selectedDateFinal.length == 0) {
          this.selectedDateFinal.push(date.getDate())
        }
        else {
          this.selectedDateFinal.pop()
          this.selectedDateFinal.push(date.getDate())
        }
      }
      if (this.tsTypeOfCalendar === "Multi") {
        let d = date.getDate()
        let ind = this.selectedDateFinal.findIndex(x => x[0] == d[0] && x[1] == d[1] && x[2] == d[2])
        if (ind != -1) {
          this.selectedDateFinal.splice(ind, 1)
        }
        else {
          this.selectedDateFinal.push(d)
        }
      }
      if (this.tsTypeOfCalendar === "Range") {
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
    }
    else {
    }
  }

  build() {
    Column() {
      Text(this.months[this.month-1] + " " + this.year).fontSize(this.tsMonthTextSize).alignSelf(ItemAlign.Start)
        .fontColor(this.tsMonthTextColor)
      Grid() {
        ForEach(this.weekDays, (item) => {
          GridItem() {
            Text(item).fontSize(this.tsGridTextSize)
          }
        })
        ForEach(this.monthDays, (item, index) => {
          GridItem() {
            CalendarCellView({
              date: item,
              month: this.month - 1,
              year: this.year,
              inMonth: this.inMonthArray[index],
              selectedDate: $selectedDateFinal,
              tsGridTextSize: this.tsGridTextSize,
              tsSelectedTextColor: this.tsSelectedTextColor,
              tsSelectedGridBackgroundColor: this.tsSelectedGridBackgroundColor,
              tsNotInMonthTextColor: this.tsNotInMonthTextColor,
              tsInMonthColor: this.tsInMonthColor,
              tsNotInMonthColor: this.tsNotInMonthColor,
              tsInMonthTextColor: this.tsInMonthTextColor,
              tsGridShape: this.tsGridShape,
              tsDayIcon: this.tsDayIcon
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
  tsTypeOfCalendar: string = "Single"
  tsIsDialog: boolean = false
  tsBgColor: ResourceColor = "#FFFFFF"
  tsGridTextSize: number | string  = '14fp'
  tsMonthTextSize: number | string  = '14fp'
  tsMonthTextColor: ResourceColor = "#000000"
  tsSelectedTextColor: ResourceColor  = "#fafafa"
  tsSelectedGridBackgroundColor: ResourceColor= "#3a4352"
  tsNotInMonthTextColor: ResourceColor = "#787a7d"
  tsInMonthColor: ResourceColor = "#ebf5ef"
  tsNotInMonthColor: ResourceColor = "#d0d9d4"
  tsInMonthTextColor: ResourceColor = "#303133"
  tsSetSelection: boolean = true
  tsWithNumbers: boolean = true
  tsLanguage: string = "English"
  tsGridShape: string = "Square"
  tsDayIcon: Resource = $r('app.string.page_show')

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        CalendarMainModel({
          tsTypeOfCalendar: this.tsTypeOfCalendar,
          tsBgColor: this.tsBgColor,
          tsGridTextSize: this.tsGridTextSize,
          tsMonthTextSize:  this.tsMonthTextSize,
          tsMonthTextColor: this.tsMonthTextColor,
          tsSelectedTextColor: this.tsSelectedTextColor,
          tsSelectedGridBackgroundColor: this.tsSelectedGridBackgroundColor,
          tsNotInMonthTextColor: this.tsNotInMonthTextColor,
          tsInMonthColor: this.tsInMonthColor,
          tsNotInMonthColor: this.tsNotInMonthColor,
          tsInMonthTextColor: this.tsInMonthTextColor,
          tsSetSelection: this.tsSetSelection,
          tsWithNumbers: this.tsWithNumbers,
          tsLanguage: this.tsLanguage
        })
        Row() {
          Button({ type: ButtonType.Normal }) {
            Text("Dismiss").fontColor('#FFFFFF').fontSize('20fp')
          }.onClick(() => {
            this.controller.close()
          })
          .width('100vp')
          .backgroundColor("#544343")
          .shadow({ radius: 3 })
        }.backgroundColor("#FFFFFF").width('100%').height('60vp')
      }
    }.padding('20vp')
  }
}