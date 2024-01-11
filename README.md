# MyLibrary
#**AlertManager**

Suppose you have created a class named 'APIManager' to handle all your API calls, if any method ever gets some error when calling an API you can show a popup on the current screen from the class by sending the current view or viewController to the class.
This method works in UIKit(Swift and Objective c). but in SwiftUI you can't do the same since the view in SwiftUI is a structure so the reference of view will be sent and it won't be able to affect the view the user is interacting with, we have a few workarounds for this problem.
- passing [closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures) to the class
- making @Published property in the class and adding a sheet or alert when that property changes
But all of these workarounds can be a bit tiring if you have multiple APIS to call we will need at least two @Published or @State properties to show an alert since an alert needs a boolean to decide when to show an alert and we will need a string to decide what message we should show to the user




In UIKit(swift) if you want to present something that the library provides on the current screen you can pass around the current view or viewController to any library
but in SwiftUI those libraries are not useful because you do not have direct access to the current(visible to the user) view in the app 

class 'AlertManager' can be used to show popups in your app from anywhere it will find the current screen the user is using and show a popup on that screen, you can also use 'AlertManager' to present sheets and show process view 
