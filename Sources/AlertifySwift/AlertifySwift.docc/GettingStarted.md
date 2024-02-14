# Getting started

This article shows basic use of AlertifySwift

## Overview

For the demo project visit [This Repository](https://github.com/manthan127/AlertifyDemo),

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

## Dismiss sheet or alert 
```
Alertify.shared.dismiss()
//This function can dissmis both alerts and sheets.
```

## Process View
AlertifySwift can display process view on the screens
```
Alertify.shared.showProcessView()
```
To remove process view
```
Alertify.shared.removeProcessView()
```
