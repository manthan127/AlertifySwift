# AlertManager

Suppose you have created a class named 'APIManager' to handle all your API calls, if any method ever gets some error when calling an API you can show a popup on the current screen from the class by sending the current view or viewController to the class.

This method works in UIKit(Swift and Objective C). but in SwiftUI you can't do the same since the view in SwiftUI is a structure so the reference of the view will be sent and it won't be able to affect the view the user is interacting with, we have a few workarounds for this problem.
- passing [closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures) to the class
```
do {
    result = try await callApi()
} catch {
    closure() // can pass the error message to closure if you need to
}
```
- making @Published property in the class and adding a sheet or alert when that property changes
We will need at least two either @Published or @State properties to show an alert since an alert needs a boolean to decide when to show an alert and we will need a string to determine what message we should display to the user
```
do {
    result = try await callApi()
} catch {
    showAlert = true // to display alert
    message = "error message you need to display" // message shown to user
}
```

```
struct MyView: View {
    @State var message = ""
    @State var showAlert = false
    var body: some View {
        VStack {
            ...
        }
        .alert(message, isPresented: $showAlert, actions: {
            ...
        })
    }
}
```


Class 'AlertManager' can be used to show popups in your app from anywhere it will find the current screen the user is using and show a popup on that screen

```
do {
    result = try await callApi()
} catch {
    AlertManager.shared.presentError("error message you need to display")
    // OR
    AlertManager.shared.presentError(error)
}
```

# Defaults
The class Defaults uses UserDefaults provided by swift to store data for your app using string as keys.
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

You can aslo give it your userDefaults to use
```
let suiteDefault = Defaults(withSuite: UserDefaults(suiteName: "suite_name") ?? .standard)
```
