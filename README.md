# AlertifySwift
[![Swift](https://img.shields.io/badge/Swift-5.5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7_5.8_5.9-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_tvOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_vision_OS_Linux_Windows_Android-Green?style=flat-square)

AlertifySwift Provides framework-independent functions to show system popups easily in your App.

AlertifySwift can be used to show popups in your iOS app from anywhere it will find the current screen the user is using and show a popup on that screen
- to display an alert popup
```
do {
    result = try await callApi()
} catch {
    Alertify.shared.displayAlert(message: "error message you need to display")
    // OR
    Alertify.shared.display(error: error)
}
```

- to display an action sheet popup
```
do {
    result = try await callApi()
} catch {
    Alertify.shared.displayAlert(message: "error message you need to display", style: .actionSheet)
    // OR
    Alertify.shared.display(error: error, style: .actionSheet)
}
```

- To present sheets on screens
```
Alertify.shared.present(view: SwiftUIView())
// OR
Alertify.shared.present {
    SwiftUIView()
}

//you can also give your ViewControllers to present on sheets
Alertify.shared.present(viewController: vc)
```

- To dismiss sheet or alert view 
```
Alertify.shared.dismiss()
```
