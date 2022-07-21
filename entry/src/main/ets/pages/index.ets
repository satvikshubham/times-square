import { CalendarMainModel } from '@ohos/times_square'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State buttonType: string = "Arabic"
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
          typeOfCalendar: "Single"
        })
      }
      if (this.buttonType === 'Multi') {
        CalendarMainModel({
          typeOfCalendar: "Multi"
        })
      }
      if (this.buttonType === 'Range') {
        CalendarMainModel({
          typeOfCalendar: "Range"
        })
      }
      if (this.buttonType === "DisplayOnly") {
        CalendarMainModel({
          typeOfCalendar: "DisplayOnly"
        })
      }
      if (this.buttonType === "Dialog") {
        CalendarMainModel({
          typeOfCalendar: "Dialog"
        })
      }
      if (this.buttonType === "Customized") {
        CalendarMainModel({
          typeOfCalendar: "Dialog"
        })
      }
      if (this.buttonType === "Arabic") {
        CalendarMainModel({
          typeOfCalendar: "Single",
          language : "Arabic"
        })
      }
    }.padding('20vp')
  }
}