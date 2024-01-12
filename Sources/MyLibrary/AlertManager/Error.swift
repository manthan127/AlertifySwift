//
//  File.swift
//  
//
//  Created by PC on 12/01/24.
//

import UIKit

//MARK: Show Error in alertView
extension AlertManager {
    private func createAlert(_ message: String) -> UIAlertController {
        let alert = UIAlertController()
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.removeProcessView()
        }
        alert.addAction(ok)
        alert.message = message

        return alert
    }

    public func presentError(_ message: String, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(createAlert(message), animated: animated, completion: completion)
    }

    public func presentError(_ error: Error, animated: Bool = true, completion: (() -> Void)? = nil) {
        presentError(error.localizedDescription, animated: animated, completion: completion)
    }

    public func presentError(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(alert, animated: animated, completion: completion)
    }

    public func present(_ message: String, animated: Bool = true, completion: (() -> Void)? = nil) {
        createAlert(message).present(rootViewController!, animated: animated, completion: completion)
    }

    public func present(_ error: Error, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(error.localizedDescription, animated: animated, completion: completion)
    }

    public func present(alert: UIAlertController, animated: Bool = true, completion: (() -> Void)? = nil) {
        alert.present(rootViewController!, animated: animated, completion: completion)
    }
}
