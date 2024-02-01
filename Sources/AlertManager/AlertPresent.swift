import SwiftUI

//MARK: Alert
public extension AlertManager {
    private func createAlert(
        title: String? = nil, message: String, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = []
    ) -> UIAlertController {
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
        error: Error, style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil)
    {
        displayAlert(message: error.localizedDescription, style: style, actions: actions, animated: animated, completion: completion)
    }

    func display(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(alert, animated: animated, completion: completion)
    }
}

public extension UIAlertAction {
    convenience init (title: String?, style: Style = .default, action: (() -> Void)? = nil) {
        self.init(title: title, style: style) { _ in
            action?()
        }
    }
}
