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

export interface CalendarOptions {
  tsTypeOfCalendar: CalendarType
  tsIsDialog?: boolean
  tsBgColor?: ResourceColor
  tsGridTextSize?: number | string
  tsMonthTextSize?: number | string
  tsMonthTextColor?: ResourceColor
  tsSelectedTextColor?: ResourceColor
  tsSelectedGridBackgroundColor?: ResourceColor
  tsNotInMonthTextColor?: ResourceColor
  tsInMonthColor?: ResourceColor
  tsNotInMonthColor?: ResourceColor
  tsInMonthTextColor?: ResourceColor
  tsSetSelection?: boolean
  tsWithNumbers?: boolean
  tsLanguage?: string
  tsGridShape?: string
  tsDayIcon?: Resource
  tsGridRadius?: string
}

export enum CalendarType {
  SINGLE = "Single",
  RANGE = "Range",
  MULTI = "Multi"
}