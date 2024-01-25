//
//  File.swift
//  
//
//  Created by PC on 12/01/24.
//

import SwiftUI

// MARK: present sheet
extension AlertManager {
    public func present<content: View>(
        view: content, modalInPresentation: Bool = false,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let vc = UIHostingController(rootView: view)
        vc.isModalInPresentation = modalInPresentation
        rootViewController?.present(vc, animated: animated, completion: completion)
    }

    public func present<content: View>(
        modalInPresentation: Bool = false,
        animated: Bool = true, completion: (() -> Void)? = nil,
        @ViewBuilder view: () -> content
    ) {
        let vc = UIHostingController(rootView: view())
        vc.isModalInPresentation = modalInPresentation
        rootViewController?.present(vc, animated: animated, completion: completion)
    }

    public func present(
        viewController: UIViewController, modalInPresentation: Bool = false,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        viewController.isModalInPresentation = modalInPresentation
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    public func dismiss(completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: true, completion: completion)
    }
}