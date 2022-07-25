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

export class Calendar {
  static ar: number[] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  static getFirstDay = (year: number, month: number): number => {
    let d = new Date(year, month - 1, 1);
    return d.getDay();
  }

  static isLeapYear = (year: number): boolean => {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  static getDaysArray = (year: number, month: number): any => {
    let days: number[] = [];
    let inMonthArray: boolean[] = [];
    let firstDay = Calendar.getFirstDay(year, month);
    let prevMonth = month - 1;
    let prevYear = year;
    if (prevMonth == 0) {
      prevMonth = 12;
      prevYear = year - 1;
    }
    let prevMonthDays = Calendar.ar[prevMonth - 1];
    if (Calendar.isLeapYear(prevYear) && prevMonth == 2) {
      prevMonthDays = 29;
    }
    for (let i = 0; i < firstDay; i++) {
      days.push((prevMonthDays - firstDay + i + 1));
      inMonthArray.push(false)
    }
    let daysInMonth = Calendar.ar[month - 1];
    if (month == 2 && Calendar.isLeapYear(year)) {
      daysInMonth = 29;
    }
    for (let i = 1; i <= daysInMonth; i++) {
      days.push(i);
      inMonthArray.push(true)
    }
    if (days.length % 7 != 0) {
      let totalNoOfDaysToAdd = 7 - (days.length % 7);
      for (let i = 1; i <= totalNoOfDaysToAdd; i++) {
        days.push(i);
        inMonthArray.push(false)
      }
    }
    return { days, inMonthArray };
  }

  static getCalendarForYear = (month: number, year: number): any => {
    let listOfMonths: number[] = []
    let listOfYear: number[] = []
    let currYear = year - 1;
    let i = 0
    while (i < 24) {
      listOfYear.push(currYear)
      listOfMonths.push(month)
      month = month + 1
      if (month == 13) {
        month = 1
        currYear = currYear + 1
      }
      i = i + 1
    }
    return { listOfYear, listOfMonths }
  }
}
