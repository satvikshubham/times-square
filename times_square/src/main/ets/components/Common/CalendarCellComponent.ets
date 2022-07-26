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
import {CalendarModel} from './CalendarModel'
@Component
export struct CalendarCellComponent {
  date: number = 0
  month: number = 0
  year: number = 0
  d: number [] = []
  @Link calendarModel : CalendarModel
  @Link selectedDates : number [][]
  inMonth: boolean = true
  isCustom: boolean = false

  aboutToAppear() {
    this.d.push(this.date)
    this.d.push(this.month)
    this.d.push(this.year)
    if (this.calendarModel.tsGridShape === "Circle") {
      this.calendarModel.tsGridRadius = '20vp'
    }
  }

  getBackgroundColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDates.length != 0 && this.selectedDates.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.calendarModel.tsSelectedGridBackgroundColor
      }
      else {
        return this.calendarModel.tsInMonthColor
      }
    }
    else {
      return this.calendarModel.tsNotInMonthColor
    }
  }
  getTextColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDates.length != 0 && this.selectedDates.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.calendarModel.tsSelectedTextColor
      }
      else {
        return this.calendarModel.tsInMonthTextColor
      }
    }
    else {
      return this.calendarModel.tsNotInMonthTextColor
    }
  }

  build() {
    if (this.selectedDates.length >= 0) {
      Row() {
        Column() {
          Text(this.date.toString()).fontSize(this.calendarModel.tsGridTextSize).fontColor(this.getTextColor(this.d))
          Image(this.calendarModel.tsDayIcon).height('10vp').width('10vp')
        }
        .width('100%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.calendarModel.tsGridRadius)
      }
      .height('90%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.calendarModel.tsGridRadius)
    }
  }
}