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
            Text("Dismiss").fontColor('#FFFFFF')
          }.onClick(()=>{
            this.controller.close()
          })
          .width('60vp')
          .backgroundColor("#544343")
          .shadow({radius:3})
        }.backgroundColor("#FFFFFF").width('100%')
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