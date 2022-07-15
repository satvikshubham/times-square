import { SingleSelectModelCalendar } from '../Common/SingleSelectModelCalendar'
import { MultiSelectModelCalendar } from '../Common/MultiSelectModelCalendar'
import { RangeSelectModelCalendar } from '../Common/RangeSelectModelCalendar'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State buttonType: string = "Single"
  unselectedButtonColor : ResourceColor = ""
  selectedButtonColor : ResourceColor = ""
  unselectedButtonTextColor : ResourceColor = ""
  selectedButtonTextColor : ResourceColor = ""

  getButtonColor=(isSelected : boolean): ResourceColor => {
    if (isSelected){
      return this.selectedButtonColor
    }
    return this.unselectedButtonColor
  }
  getButtonTextColor = (isSelected: boolean) : ResourceColor =>{
    if (isSelected){
      return this.selectedButtonTextColor
    }
    return this.unselectedButtonTextColor
  }
  build() {
    Column() {
      Scroll(this.scroller) {
        Row({ space: '5vp' }) {
          Toggle({ type: ToggleType.Button, isOn: true}) {
            Text('Single').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Single"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Multi').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Multi"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Range').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Range"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('DisplayOnly').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "DisplayOnly"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Dialog').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Dialog"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Customized').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Customized"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Decorator').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Decorator"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Arabic').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Arabic"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Arabic with digits').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Arabic with digits"
          })
          Toggle({ type: ToggleType.Button, isOn: false}) {
            Text('Custom View').padding({ left: 12, right: 12 }).fontSize('20fp')
          }.height('40vp')
          .selectedColor(0x39a2db)
          .onChange((isOn: boolean) => {
            this.buttonType = "Custom View"
          })
//          Button('Single').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Single"
//            })
//          Button('Multi').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Multi"
//            })
//          Button('Range').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Range"
//            })
//          Button('DisplayOnly').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "DisplayOnly"
//            })
//          Button('Dialog').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Dialog"
//            })
//          Button('Customized').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Customized"
//            })
//          Button('Decorator').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Decorator"
//            })
//          Button('Arabic').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Arabic"
//            })
//          Button('Arabic with digits').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Arabic with digits"
//            })
//          Button('Custom View').type(ButtonType.Normal)
//            .onClick(() => {
//              this.buttonType = "Custom View"
//            })
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