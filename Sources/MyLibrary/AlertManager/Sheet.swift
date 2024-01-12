//
//  File.swift
//  
//
//  Created by PC on 12/01/24.
//

import SwiftUI

// MARK: present sheet
extension AlertManager {
    public func present<content: View>(_ view: content, animated: Bool = true, modalInPresentation: Bool = false, completion: (() -> Void)? = nil) {
        let vc = UIHostingController(rootView: view)
        present(vc, animated: animated, modalInPresentation: modalInPresentation, completion: completion)
    }

    public func present(_ viewController: UIViewController, animated: Bool = true, modalInPresentation: Bool = false, completion: (() -> Void)? = nil) {
        viewController.isModalInPresentation = modalInPresentation
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    public func dismiss(completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: true, completion: completion)
    }
}
