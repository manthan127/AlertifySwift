# AlertifySwift
[![Swift](https://img.shields.io/badge/Swift-5.5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7_5.8_5.9-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_tvOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_vision_OS_Linux_Windows_Android-Green?style=flat-square)

- [Features](#features)
- [Requirements](#requirements)
- [Demo](https://github.com/manthan127/AlertifyDemo)
- [License](#license)


## Features
AlertifySwift Provides framework-independent functions to show system popups easily in your App.

AlertifySwift can be used to show popups in your iOS and tvOS app from anywhere it will find the current screen the user is using and show a popup on that screen

## Display an alert
```
do {
    result = try await callApi()
} catch {
    Alertify.shared.alert(title: "Title", message: "error message you need to display")
    // OR
    Alertify.shared.alert(title: "Title", error: error)
}
```
AlertifySwift also provides way to present action sheets in your app
```
Alertify.shared.alert(title: "ActionSheet", style: .actionSheet)
```
you can also give your UIAlertController to present
```
let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
Alertify.shared.display(alert: alert)
```
All the methods described above also has extra parameters with default values provided
- style
    - This variable decides if popup will be alert or action sheet
- animated
    - If value is false then sheet will not be presented with animation. otherwise it will be presented with animation
- onDismiss
    - it's an clouser that Will be called when alert is dismissed

## Present a sheet
```
Alertify.shared.present(view: SwiftUIView())
// OR
Alertify.shared.present() {
    SwiftUIView()
}
```
You can also give your ViewControllers to present on sheets
```
Alertify.shared.present(viewController: vc)
```
All this variants present method also has some parameters with default value
- dismissOnSwipe
    - If value is false then sheet can't be dismissed by swipe-down. otherwise sheet will be dismissed by swipe-down
- animated
    - If value is false then sheet will not be presented with animation. otherwise it will be presented with animation
- onDismiss
    - it's an clouser that Will be called when alert is dismissed

## Dismiss sheet or alert 
```
Alertify.shared.dismiss()
//This function can dissmis both alerts and sheets.
```

## Process View
AlertifySwift can also display process view on the screens
```
Alertify.shared.showProcessView()
//To remove process view
Alertify.shared.removeProcessView()
```

## Requirements
| Platform | Minimum Version |
| -------- | --------------- |
| iOS      | 13.0            |
| tvOS     | 13.0            | 


## License

AlertifySwift is released under the The Unlicense. [See LICENSE](https://github.com/manthan127/AlertifySwift/blob/main/LICENSE) for details.
