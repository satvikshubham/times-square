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