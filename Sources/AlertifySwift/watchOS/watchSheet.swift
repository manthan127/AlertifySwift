#if os(watchOS)
import WatchKit

//TODO: add docs
public extension Alertify {
    func present(
        interfaceController: WKInterfaceController, dismissOnSwipe: Bool = true,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        
    }
}
#endif
