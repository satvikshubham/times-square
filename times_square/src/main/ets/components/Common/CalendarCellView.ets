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

@Component
export struct CalendarCellView {
  date: number = 0
  month: number = 0
  year: number = 0
  d: number [] = []
  @Link selectedDate: number [][]

  // Attributes
  tsDayIcon: Resource
  tsGridTextSize: number | string | Resource = '20fp'
  tsInMonthColor: ResourceColor = "#ebf5ef"
  tsNotInMonthColor: ResourceColor = "#d0d9d4"
  tsInMonthTextColor: ResourceColor = "#303133"
  tsNotInMonthTextColor: ResourceColor = "#787a7d"
  tsSelectedTextColor: ResourceColor  = "#fafafa"
  tsSelectedGridBackgroundColor: ResourceColor= "#3a4352"
  tsGridShape: string = "Square"
  tsGridRadius: string = '0vp'

  // Logic
  inMonth: boolean = true
  isCustom: boolean = false

  aboutToAppear() {
    this.d.push(this.date)
    this.d.push(this.month)
    this.d.push(this.year)
    if (this.tsGridShape === "Circle") {
      this.tsGridRadius = '20vp'
    }
  }

  getBackgroundColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDate.length != 0 && this.selectedDate.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.tsSelectedGridBackgroundColor
      }
      else {
        return this.tsInMonthColor
      }
    }
    else {
      return this.tsNotInMonthColor
    }
  }
  getTextColor = (date: number[]): ResourceColor => {
    if (this.inMonth) {
      if (this.selectedDate.length != 0 && this.selectedDate.find(x => x[0] == date[0] && x[1] == date[1] && x[2] == date[2])) {
        return this.tsSelectedTextColor
      }
      else {
        return this.tsInMonthTextColor
      }
    }
    else {
      return this.tsNotInMonthTextColor
    }
  }

  build() {
    if (this.selectedDate.length >= 0) {
      Row() {
        Column() {
          Text(this.date.toString()).fontSize(this.tsGridTextSize).fontColor(this.getTextColor(this.d))
          Image(this.tsDayIcon).height('10vp').width('10vp')
        }
        .width('100%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.tsGridRadius)
      }
      .height('90%').backgroundColor(this.getBackgroundColor(this.d)).borderRadius(this.tsGridRadius)
    }
  }
}