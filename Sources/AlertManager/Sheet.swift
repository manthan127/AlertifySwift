import SwiftUI

// MARK: Sheets
public extension AlertManager {
    func present<content: View>(
        view: content, dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let vc = UIHostingController(rootView: view)
        vc.isModalInPresentation = !dismissOnSwipe

        rootViewController?.present(vc, animated: animated, completion: completion)
    }

    func present<content: View>(
        dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil,
        @ViewBuilder view: () -> content
    ) {
        let vc = UIHostingController(rootView: view())
        vc.isModalInPresentation = !dismissOnSwipe

        rootViewController?.present(vc, animated: animated, completion: completion)
    }

    func present(
        viewController: UIViewController, dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        viewController.isModalInPresentation = !dismissOnSwipe
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: true, completion: completion)
    }
}
