export class DATE {
  private day: number;
  private month: number;
  private year: number;
  private date: number[] = []

  setDate = (day: number, month: number, year: number): void => {
    if (this.date.length == 0) {
      this.date.push(year)
      this.date.push(month)
      this.date.push(day)
    }
    else{
      this.date.pop()
      this.date.pop()
      this.date.pop()
      this.date.push(year)
      this.date.push(month)
      this.date.push(day)
    }
  }

  getDate = (): number [] => {
    return this.date
  }
}