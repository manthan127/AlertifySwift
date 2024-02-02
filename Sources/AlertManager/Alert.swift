import SwiftUI

//MARK: Alert
public extension AlertManager {
    private func createAlert(
        title: String? = nil, message: String, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = []
    ) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)

        if actions.isEmpty {
            let ok = UIAlertAction(title: "OK", style: .default) { _ in
                self.removeProcessView()
            }
            alert.addAction(ok)
        } else {
            actions.forEach(alert.addAction(_:))
        }

        return alert
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///     - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///     - message: Descriptive text that provides additional details about the reason for the alert.
    ///     - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (alert is default style)
    ///     - actions: for the buttons in popup.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func displayAlert(
        title: String? = nil, message: String, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let alert = createAlert(title: title, message: message, style: style, actions: actions)
        display(alert: alert, animated: animated, completion: completion)
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///     - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///     - error: Descriptive text that provides additional details about the reason for the alert.
    ///     - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (alert is default style)
    ///     - actions: for the buttons in popup.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func display(
        title: String? = nil, error: Error, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        displayAlert(title: title, message: error.localizedDescription, style: style, actions: actions, animated: animated, completion: completion)
    }

    /// Display alert on the screen.
    /// - Parameters:
    ///     - alert: An object that can displays an alert message to the user.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func display(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(alert, animated: animated, completion: completion)
    }
}

public extension UIAlertAction {
    /// Create and return an action with the specified title and behavior.
    /// - Parameters:
    ///     - title: The text to use for the button title. The value you specify should be localized for the user’s current language.
    ///     - style: Additional styling information to apply to the button. Use the style information to convey the type of action that is performed by the button.
    ///     - action: A block to execute when the user selects the action.
    /// - Returns: A new alert action object.
    convenience init (title: String, style: Style = .default, action: (() -> Void)? = nil) {
        self.init(title: title, style: style) { _ in
            action?()
        }
    }
}
