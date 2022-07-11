export class Calendar {
    static ar: number[] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    static listOfMonths: number[] = []
    static listOfYear: number[] = []
    static getFirstDay = (year: number, month: number): number => {
      let d = new Date(year, month - 1, 1);
      return d.getDay();
    }
  
    static isLeapYear = (year: number): boolean => {
      return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
  
    static getDaysArray = (year: number, month: number): any => {
      let days: string[] = [];
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
        days.push((prevMonthDays - firstDay + i + 1).toString());
        inMonthArray.push(false)
      }
      let daysInMonth = Calendar.ar[month - 1];
      if (month == 2 && Calendar.isLeapYear(year)) {
        daysInMonth = 29;
      }
      for (let i = 1; i <= daysInMonth; i++) {
        days.push(i.toString());
        inMonthArray.push(true)
      }
      if (days.length % 7 != 0) {
        let totalNoOfDaysToAdd = 7 - (days.length % 7);
        for (let i = 1; i <= totalNoOfDaysToAdd; i++) {
          days.push(i.toString());
          inMonthArray.push(false)
        }
      }
      return { days, inMonthArray };
    }
    static getCalendarForYear = (month: number, year: number): any => {
      let currYear = year - 1;
      let yearPassed = false
      let i = 0
      while (i <= 12) {
        Calendar.listOfYear.push(currYear)
        Calendar.listOfYear.push(month)
        month = month + 1
        if (month == 12) {
          yearPassed = true
          month = 1
          currYear = currYear + 1
        }
      }
      return { yearArray: Calendar.listOfYear, monthArray: Calendar.listOfMonths }
    }

    getDaysInRange = (startDate: Date, endDate: Date): any => {
      let days: string[] = [];
      let inMonthArray: boolean[] = [];
      let startDateYear = startDate.getFullYear();
      let startDateMonth = startDate.getMonth();
      let startDateDay = startDate.getDate();
      let endDateYear = endDate.getFullYear();
      let endDateMonth = endDate.getMonth();
      let endDateDay = endDate.getDate();
      let startDateFirstDay = Calendar.getFirstDay(startDateYear, startDateMonth);
      let endDateFirstDay = Calendar.getFirstDay(endDateYear, endDateMonth);
      let startDateDaysInMonth = Calendar.ar[startDateMonth];
      if (startDateMonth == 2 && Calendar.isLeapYear(startDateYear)) {
        startDateDaysInMonth = 29;
      }
      let endDateDaysInMonth = Calendar.ar[endDateMonth];
      if (endDateMonth == 2 && Calendar.isLeapYear(endDateYear)) {
        endDateDaysInMonth = 29;
      }
      for (let i = 0; i < startDateFirstDay; i++) {
        days.push((startDateDaysInMonth - startDateFirstDay + i + 1).toString());
        inMonthArray.push(false)
      }
      for (let i = 1; i <= endDateDay; i++) {
        days.push(i.toString());
        inMonthArray.push(true)
      }
      if (days.length % 7 != 0) {
        let totalNoOfDaysToAdd = 7 - (days.length % 7);
        for (let i = 1; i <= totalNoOfDaysToAdd; i++) {
          days.push(i.toString());
          inMonthArray.push(false)
        }
      }
      return { days, inMonthArray };
    }
  }
  