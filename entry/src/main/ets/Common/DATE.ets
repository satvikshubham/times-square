export class DATE {
  private day: number;
  private month: number;
  private year: number;
  private date: number[] = []

  setDate = (day: number, month: number, year: number): void => {
    if (this.date.length == 0) {
      this.date.push(day)
      this.date.push(month)
      this.date.push(year)
    }
    else {
      this.date.pop()
      this.date.pop()
      this.date.pop()
      this.date.push(day)
      this.date.push(month)
      this.date.push(year)
    }
  }

  getDate = (): number [] => {
    return this.date
  }
}