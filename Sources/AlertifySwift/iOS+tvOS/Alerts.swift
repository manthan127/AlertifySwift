#if os(iOS) || os(tvOS)
import SwiftUI

public extension Alertify {
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

    func displayAlert(
        title: String? = nil, message: String, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let alert = createAlert(title: title, message: message, style: style, actions: actions)
        display(alert: alert, animated: animated, completion: completion)
    }

    func display(
        title: String? = nil, error: Error, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        displayAlert(title: title, message: error.localizedDescription, style: style, actions: actions, animated: animated, completion: completion)
    }

    func display(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootVC?.present(alert, animated: animated, completion: completion)
    }
}

public extension UIAlertAction {
    /// Create and return an action with the specified title and behavior.
    /// - Parameters:
    ///     - title: The text to use for the button title. The value you specify should be localized for the user’s current language.  This parameter must not be nil, except in a tvOS app where a nil title may be used with UIAlertAction.Style.cancel.
    ///     - style: Additional styling information to apply to the button. Use the style information to convey the type of action that is performed by the button.
    ///     - action: A block to execute when the user selects the action.
    /// - Returns: A new alert action object.
    convenience init (title: String?, style: Style = .default, action: (() -> Void)? = nil) {
        self.init(title: title, style: style) { _ in
            action?()
        }
    }
}
#endif