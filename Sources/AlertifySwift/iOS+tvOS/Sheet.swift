#if os(iOS) || os(tvOS)
import SwiftUI
//TOOD: behavior dismissOnSwipe in tvOS??
public extension Alertify {
    func present<content: View>(
        view: content, dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        let vc = UIHostingController(rootView: view)
        vc.isModalInPresentation = !dismissOnSwipe

        rootVC?.present(vc, animated: animated, completion: completion)
    }

    func present<content: View>(
        dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil,
        @ViewBuilder view: () -> content
    ) {
        let vc = UIHostingController(rootView: view())
        vc.isModalInPresentation = !dismissOnSwipe

        rootVC?.present(vc, animated: animated, completion: completion)
    }

    func present(
        viewController: UIViewController, dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        viewController.isModalInPresentation = !dismissOnSwipe
        rootVC?.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootVC?.dismiss(animated: animated, completion: completion)
    }
}
#endif
