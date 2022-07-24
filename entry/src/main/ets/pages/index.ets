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

import { CalendarMainModel } from '@ohos/times_square'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State buttonType: string = "Single"
  unselectedButtonColor: ResourceColor = "#ccc6b6"
  selectedButtonColor: ResourceColor = "#403927"
  unselectedButtonTextColor: ResourceColor = "#0c1f1a"
  selectedButtonTextColor: ResourceColor = "#f5f3ed"
  getButtonColor= (buttonType: string, buttonName: string): ResourceColor => {
    if (buttonType === buttonName) {
      return this.selectedButtonColor
    }
    else {
      return this.unselectedButtonColor
    }
  }
  getButtonTextColor = (buttonType: string, buttonName: string): ResourceColor => {
    if (buttonType === buttonName) {
      return this.selectedButtonTextColor
    }
    else {
      return this.unselectedButtonTextColor
    }
  }

  build() {
    Column() {
      Scroll(this.scroller) {
        Row({ space: '10vp' }) {
          Button({ type: ButtonType.Normal }) {
            Text('Single').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Single"))
          }
          .onClick(() => {
            this.buttonType = "Single"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Single"))

          Button({ type: ButtonType.Normal }) {
            Text('Multi').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Multi"))
          }
          .onClick(() => {
            this.buttonType = "Multi"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Multi"))

          Button({ type: ButtonType.Normal }) {
            Text('Range').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Range"))
          }
          .onClick(() => {
            this.buttonType = "Range"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Range"))

          Button({ type: ButtonType.Normal }) {
            Text('DisplayOnly').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "DisplayOnly"))
          }
          .onClick(() => {
            this.buttonType = "DisplayOnly"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "DisplayOnly"))

          Button({ type: ButtonType.Normal }) {
            Text('Dialog').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Dialog"))
          }
          .onClick(() => {
            this.buttonType = "Dialog"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Dialog"))

          Button({ type: ButtonType.Normal }) {
            Text('Customized').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Customized"))
          }
          .onClick(() => {
            this.buttonType = "Customized"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Customized"))

          Button({ type: ButtonType.Normal }) {
            Text('Decorator').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Decorator"))
          }
          .onClick(() => {
            this.buttonType = "Decorator"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Decorator"))

          Button({ type: ButtonType.Normal }) {
            Text('Arabic').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Arabic"))
          }
          .onClick(() => {
            this.buttonType = "Arabic"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Arabic"))

          Button({ type: ButtonType.Normal }) {
            Text('Arabic with digits').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Arabic with digits"))
          }
          .onClick(() => {
            this.buttonType = "Arabic with digits"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Arabic with digits"))

          Button({ type: ButtonType.Normal }) {
            Text('Custom View').fontSize('20fp')
              .padding({ left: '20vp', right: '20vp' })
              .fontColor(this.getButtonTextColor(this.buttonType, "Custom View"))
          }
          .onClick(() => {
            this.buttonType = "Custom View"
          })
          .shadow({ radius: 10 })
          .backgroundColor(this.getButtonColor(this.buttonType, "Custom View"))

        }
      }.padding({ bottom: '10vp' })
      .scrollable(ScrollDirection.Horizontal)

      if (this.buttonType === 'Single') {
        CalendarMainModel({
          tsTypeOfCalendar: "Single",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === 'Multi') {
        CalendarMainModel({
          tsTypeOfCalendar: "Multi",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === 'Range') {
        CalendarMainModel({
          tsTypeOfCalendar: "Range",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === "DisplayOnly") {
        CalendarMainModel({
          tsTypeOfCalendar: "Single",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === "Dialog") {
        CalendarMainModel({
          tsTypeOfCalendar: "Multi",
          tsIsDialog: true,
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === "Customized") {
        CalendarMainModel({
          tsTypeOfCalendar: "Single",
          tsIsDialog: true,
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "English",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === "Arabic") {
        CalendarMainModel({
          tsTypeOfCalendar: "Single",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: false,
          tsLanguage: "Arabic",
          tsGridShape: "Square"
        })
      }
      if (this.buttonType === "Arabic with digits") {
        CalendarMainModel({
          tsTypeOfCalendar: "Single",
          tsBgColor: "#FFFFFF",
          tsGridTextSize:'14fp',
          tsMonthTextSize:  '14fp',
          tsMonthTextColor: "#000000",
          tsSelectedTextColor: "#fafafa",
          tsSelectedGridBackgroundColor: "#3a4352",
          tsNotInMonthTextColor: "#787a7d",
          tsInMonthColor: "#ebf5ef",
          tsNotInMonthColor: "#d0d9d4",
          tsInMonthTextColor: "#303133",
          tsSetSelection: true,
          tsWithNumbers: true,
          tsLanguage: "Arabic",
          tsGridShape: "Square"
        })
      }
    }.padding('20vp')
  }
}