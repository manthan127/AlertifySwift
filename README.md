# AlertManager

AlertManager can be used to show popups in your iOS app from anywhere it will find the current screen the user is using and show a popup on that screen

AlertManager Provides framework-independent (UIKit or SwiftUI) functions to show system popups easily in your iOS App
- to display an alert popup
```
do {
    result = try await callApi()
} catch {
    AlertManager.shared.displayAlert(message: "error message you need to display")
    // OR
    AlertManager.shared.display(error: error)
}
```

- to display an action sheet popup
```
do {
    result = try await callApi()
} catch {
    AlertManager.shared.displayAlert(message: "error message you need to display", style: .actionSheet)
    // OR
    AlertManager.shared.display(error: error, style: .actionSheet)
}
```

- To present sheets on screens
```
AlertManager.shared.present(view: SwiftUIView())
// OR
AlertManager.shared.present {
    SwiftUIView()
}

//you can also give your ViewControllers to present on sheets
AlertManager.shared.present(viewController: vc)
```

- To dismiss sheet or alert view 
```
AlertManager.shared.dismiss()
```
