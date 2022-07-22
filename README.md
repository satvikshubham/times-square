# Times Square
****
Times Square helps you to pick and customize calendar with multiple attributes and support for Arabic calendar 
## Dependencies
****
For using Times Square in your app, add the below dependency in the entry/package.json  
```
"dependencies": {
    "@ohos/times_square": "file:../times_square"
  }
```
Add dependency command with
```
npm i @ohos/times_square
```
## Usage instructions
****
Import all components at once
```
import { CalendarMainModel } from '@ohos/times_square'
```
## Screenshots
****

## How to use it
### Imports
Import the following
```
import { CalendarMainModel } from '@ohos/times_square'
```
### Code
To pickup from the days of the week, pass the variable of type business
```
BusinessPicker({
            selectedBusinessModel: $[YourModelName],
            bhTextColor: 'textColor',
            bhTextSize: textSize,
            bhTextStyle: 'font',
            bhFormat : (format 12 or 24)
            bhTodayColor: 'todayColor'
          })
```
To display full list of business days
```
BusinessHoursWeekView({
        showBusinessModel: this.[YourModelName],
        bhIcon: $r(resource),
        bhIconPadding: padding,
        bhTextColor: 'textColor',
        bhTextSize: textSize,
        bhTextStyle: 'font',
        bhTodayColor: 'todayColor',
        bhTodayStyle: 'todayFont',
        bhTodayTextSize: todayTextSize,
        bhTodayIcon: $r(resource)
      })
```
## Styling
****
You can style the viewer  using theses attributes :

| Attribute  | Description  |
| ------------ | ------------ |
| bhIcon  | Left icon of the day  |
|bhTextColor   |  Text color |
| bhTextSize  | Text Size  |
| bhIconPadding  | Left icon padding  |
|  bhTextStyle | Default text style   |
|  bhTodayStyle | Today  text style (highlighted)   |
|  bhTodayColor | Today  text color (highlighted)   |
|  bhTodayTextSize | Today  text size|
| bhTodayIcon | Today left icon|
| bhFormat |12 or 24 hours format|
## Compatibility
****
Supports OpenHarmony API version 9
## Code Contribution
****
If you find any problems during usage, you can submit an [issue](https://github.com/satvikshubham/BusinessHoursPicker/issues/new/choose) to us. Of course, we also welcome you to send us PR.
## Open source License
****
This project is based on [Apache License 2.0](./LICENSE), please enjoy and participate in open source freely.
