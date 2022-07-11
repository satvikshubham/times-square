import { SingleSelectModelCalendar } from '../Common/SingleSelectModelCalendar'
import { MultiSelectModelCalendar } from '../Common/MultiSelectModelCalendar'
import { RangeSelectModelCalendar } from '../Common/RangeSelectModelCalendar'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State buttonType: string = "Single"

  build() {
    Column() {
      Scroll(this.scroller) {
        Row({ space: '5vp' }) {
          Button('Single').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Single"
            })
          Button('Multi').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Multi"
            })
          Button('Range').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Range"
            })
          Button('DisplayOnly').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "DisplayOnly"
            })
          Button('Dialog').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Dialog"
            })
          Button('Customized').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Customized"
            })
          Button('Decorator').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Decorator"
            })
          Button('Arabic').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Arabic"
            })
          Button('Arabic with digits').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Arabic with digits"
            })
          Button('Custom View').type(ButtonType.Normal)
            .onClick(() => {
              this.buttonType = "Custom View"
            })
        }
      }.padding({ bottom: '10vp' })
      if (this.buttonType === 'Single'){
        SingleSelectModelCalendar({

        })
      }
      if (this.buttonType === 'Multi'){
        MultiSelectModelCalendar({

        })
      }
      if (this.buttonType === 'Range'){
        RangeSelectModelCalendar({

        })
      }
    }.padding('20vp')
  }
}