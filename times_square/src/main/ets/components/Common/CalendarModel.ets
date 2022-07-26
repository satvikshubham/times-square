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

import { CalendarOptions, CalendarType } from './Types'

export class CalendarModel implements CalendarOptions {

  tsSelectedDates : number [][] = []
  tsTypeOfCalendar: CalendarType = CalendarType.SINGLE
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
  tsGridRadius : string = '0vp'
  tsDayIcon: Resource = $r('app.string.page_show')
  constructor(options?: CalendarOptions) {
    if (options != undefined) {
      if (options.tsTypeOfCalendar != undefined) this.tsTypeOfCalendar = options.tsTypeOfCalendar
      if (options.tsIsDialog != undefined) this.tsIsDialog = options.tsIsDialog
      if (options.tsBgColor != undefined) this.tsBgColor = options.tsBgColor
      if (options.tsGridTextSize != undefined) this.tsGridTextSize = options.tsGridTextSize
      if (options.tsMonthTextSize != undefined) this.tsMonthTextSize = options.tsMonthTextSize
      if (options.tsMonthTextColor != undefined) this.tsMonthTextColor = options.tsMonthTextColor
      if (options.tsSelectedTextColor != undefined) this.tsSelectedTextColor = options.tsSelectedTextColor
      if (options.tsSelectedGridBackgroundColor != undefined) this.tsSelectedGridBackgroundColor = options.tsSelectedGridBackgroundColor
      if (options.tsSelectedGridBackgroundColor != undefined) this.tsSelectedGridBackgroundColor = options.tsSelectedGridBackgroundColor
      if (options.tsNotInMonthTextColor != undefined) this.tsNotInMonthTextColor = options.tsNotInMonthTextColor
      if (options.tsInMonthColor != undefined) this.tsInMonthColor = options.tsInMonthColor
      if (options.tsInMonthTextColor != undefined) this.tsInMonthTextColor = options.tsInMonthTextColor
      if (options.tsSetSelection != undefined) this.tsSetSelection = options.tsSetSelection
      if (options.tsWithNumbers != undefined) this.tsWithNumbers = options.tsWithNumbers
      if (options.tsLanguage != undefined) this.tsLanguage = options.tsLanguage
      if (options.tsGridShape != undefined) this.tsGridShape = options.tsGridShape
      if (options.tsGridRadius != undefined) this.tsGridShape = options.tsGridRadius
      if (options.tsDayIcon != undefined) this.tsDayIcon = options.tsDayIcon
    }
  }
}
