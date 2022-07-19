import { SingleSelectModelCalendar } from './SingleSelectModelCalendar'

@CustomDialog
struct DialogBoxComponent {
  controller: CustomDialogController
  cancel: () => void
  okay: () => void
  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        SingleSelectModelCalendar({})
        Row() {
          Button({ type: ButtonType.Normal }) {
            Text("Dismiss").fontColor('#FFFFFF').fontSize('20fp')
          }.onClick(()=>{
            this.controller.close()
          })
          .width('100vp')
          .backgroundColor("#544343")
          .shadow({radius:3})
        }.backgroundColor("#FFFFFF").width('100%').height('60vp')
      }
    }.padding('20vp')
  }
}

@Entry
@Component
export struct DialogModelCalendar {
  dialogBoxController: CustomDialogController = new CustomDialogController({
    builder: DialogBoxComponent({}),
    autoCancel: true
  })
  aboutToAppear() {
    this.dialogBoxController.open()
  }
  build() {
  }
}