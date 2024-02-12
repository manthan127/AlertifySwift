#if os(watchOS)
import WatchKit

//TODO: add docs
public extension Alertify {
    func displayAlert(
        withTitle title: String?, message: String?,
        preferredStyle style: WKAlertControllerStyle = .alert, actions: [WKAlertAction]
    ) {
        rootInterfaceController?.presentAlert(withTitle: title, message: message, preferredStyle: style, actions: actions)
    }
    
    func dismiss() {
        rootInterfaceController?.dismiss()
    }
}
#endif
