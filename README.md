# AlertManager

Class 'AlertManager' can be used to show popups in your app from anywhere it will find the current screen the user is using and show a popup on that screen

```
do {
    result = try await callApi()
} catch {
    AlertManager.shared.presentAlert(message: "error message you need to display")
    // OR
    AlertManager.shared.present(error: error)
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
