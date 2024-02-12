# ``AlertifySwift``

AlertifySwift Provides framework-independent functions to show system popups easily in your App.

## Overview

AlertifySwift can be used to show popups in your iOS or tvOS app from anywhere, AlertifySwift will find the current screen the user is using to display the popups

## Topics
### Display an alert
```
do {
result = try await callApi()
} catch {
Alertify.shared.alert(message: "error message you need to display")
// OR
Alertify.shared.alert(error: error)

}
```
you can also give your UIAlertController to present
```
let alert = UIAlertController(title: title, message: message, preferredStyle: style)
Alertify.shared.display(alert: alert)
```
These methods also takes extra parameters which are given default values
```
title: String? = nil
style: UIAlertController.Style = .alert
actions: [UIAlertAction] = []

title: The title of the alert
style: The style to use when presenting the alert controller
actions: for the buttons in popup
```

```
animated: Bool = true
completion: (() -> Void)? = nil

animated: Pass true to animate the presentation; otherwise, pass false.
completion: The block to execute after the presentation finishes. You may specify nil for this parameter.
```

### Present a sheets
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
all these methods also takes extra parameters which are given default values
```
dismissOnSwipe: Bool = true
animated: Bool = true
completion: (() -> Void)? = nil

dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
animated: Pass true to animate the presentation; otherwise, pass false.
completion: The block to execute after the presentation finishes. You may specify nil for this parameter.
```

### Dismiss sheet or alert view 
```
Alertify.shared.dismiss()
//This function can dissmis both alerts and sheets.
```

### Group

- ``Symbol``
