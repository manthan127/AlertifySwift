# ``AlertifySwift``

Provides framework-independent functions to show system popups easily in your App.

## Overview

AlertifySwift can be used to show popups in your iOS or tvOS app from anywhere, AlertifySwift will find the current screen the user is using to display the popups

## Topics

### Display an alert
- ``Alertify/alert(title:error:style:actions:animated:completion:)`` 
- ``Alertify/alert(title:message:style:actions:animated:completion:)``
- ``Alertify/display(alert:animated:completion:)``

### Present a sheets
- ``Alertify/present(view:dismissOnSwipe:animated:completion:)``
- ``Alertify/present(dismissOnSwipe:animated:completion:@ViewBuilder:)``
- ``Alertify/present(viewController:dismissOnSwipe:animated:completion:)``

### Dismiss sheet or alert 
- ``Alertify/dismiss(animated:completion:)``
