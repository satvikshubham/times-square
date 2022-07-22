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

export class DATE {
  private day: number;
  private month: number;
  private year: number;
  private date: number[] = []

  constructor(day?: number, month?: number, year?: number) {
    this.day = day;
    this.month = month;
    this.year = year;
  }

  setDate = (day: number, month: number, year: number): void => {
    if (this.date.length == 0) {
      this.day = day
      this.month = month
      this.year = year
    }
    else {
      this.day = day
      this.month = month
      this.year = year
    }
  }
  getDate = (): number [] => {
    return [this.day, this.month, this.year]
  }
  getDay = () : number =>{
    return this.day
  }
  getMonth = () : number =>{
    return this.month
  }
  getYear = () : number =>{
    return this.year
  }
}