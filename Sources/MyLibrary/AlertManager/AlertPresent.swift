//
//  File.swift
//  
//
//  Created by PC on 12/01/24.
//

import UIKit
import SwiftUI

//MARK: Show Error in alertView
extension AlertManager {
    typealias Style = UIAlertController.Style

    private func createAlert(
        title: String? = nil, message: String, style: Style = .alert,
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

    public func presentAlert(
        title: String? = nil, message: String, style: Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let alert = createAlert(title: title, message: message, style: style, actions: actions)

        present(alert: alert, animated: animated, completion: completion)
    }

    public func present(
        error: Error, style: Style = .alert,
        actions: [UIAlertAction] = [],
        animated: Bool = true, completion: (() -> Void)? = nil)
    {
        presentAlert(message: error.localizedDescription, style: style, actions: actions, animated: animated, completion: completion)
    }

    public func present(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(alert, animated: animated, completion: completion)
    }
}

extension UIAlertAction {
    convenience init (title: String?, style: Style = .default, action: (() -> ())? = nil) {
        self.init(title: title, style: style) { _ in
            action?()
        }
    }
}
