# AlertManager

Class 'AlertManager' can be used to show popups in your iOS app from anywhere it will find the current screen the user is using and show a popup on that screen

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

# Defaults
The class Defaults uses UserDefaults provided by Swift to store data for your app using strings as keys.
Defaults provide functions that make it simple to store data on the device
- to set data
```
Defaults.standard.set(data, forKey: "key")
// OR
Defaults.standard["key"] = data
```
- to get data
```
let data = Defaults.standard.object(forType: DataType.self, forKey: "key")
// OR
let data: DataType = Defaults.standard["key"] // You need to specify datatype of variable 
```
- to remove data
```
Defaults.standard.removeObject(forKey: "key")
//OR
Defaults.standard["key"] = nil
```

You can give suiteName to this class just like UserDefaults 
```
let suiteDefault = Defaults(suiteName: "suite_name") // suiteDefault.Type is Defaults?
```

You can also give it your userDefaults to use
```
let suiteDefault = Defaults(withSuite: UserDefaults(suiteName: "suite_name") ?? .standard)
```
