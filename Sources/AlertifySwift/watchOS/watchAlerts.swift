//
//  File.swift
//  
//
//  Created by Home on 11/02/24.
//
#if os(watchOS)
import WatchKit

//TODO: add docs
public extension Alertify {
    func displayAlert(
        title: String?, message: String?, style: WKAlertControllerStyle = .alert,
        actions: [WKAlertAction]
    ) {
        //        let action = WKAlertAction(title: "OK", style: .default) {}
        rootInterfaceController?.presentAlert(withTitle: title, message: message, preferredStyle: style, actions: actions)
    }
    
    func dismiss() {
        rootInterfaceController?.dismiss()
    }
}
#endif
