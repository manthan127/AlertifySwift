import SwiftUI

//TODO: Add navigation (if possible)
//TODO: Add Discussions in docs
//TODO: Add Summery and Discussions of class and environment object in docs
//TODO: Add to class Alertify UINavigationControllerDelegate (might be able to get latest UIViewController on navigation)
//      (need to test if this will be faster than current methode of using rootViewController other wise not worth it)
//TODO: Add capability to use package in watchOS and macOS
//TODO: update README file
//TODO: create demo for the package

protocol Doc {
    // MARK: Alert

    /// Display alert on the screen.
    /// - Parameters:
    ///     - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///     - message: Descriptive text that provides additional details about the reason for the alert.
    ///     - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (default style is .alert)
    ///     - actions: for the buttons in popup.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func alert(
        title: String?, message: String, style: UIAlertController.Style,
        actions: [UIAlertAction],
        animated: Bool, completion: (() -> Void)?
    )
    
    /// Display alert on the screen.
    /// - Parameters:
    ///     - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
    ///     - error: Descriptive text that provides additional details about the reason for the alert.
    ///     - style: The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert. (default style is .alert)
    ///     - actions: for the buttons in popup.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func alert(
        title: String?, error: Error, style: UIAlertController.Style,
        actions: [UIAlertAction],
        animated: Bool, completion: (() -> Void)?
    )
    
    /// Display alert on the screen.
    /// - Parameters:
    ///     - alert: An object that can displays an alert message to the user.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func display(alert: UIAlertController, animated: Bool, completion: (() -> Void)?)


    // MARK: Sheet
    
    /// Present sheet on the screen.
    /// - Parameters:
    ///     - view: A SwiftUIView to display on sheet.
    ///     - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func present<content: View>(
        view: content, dismissOnSwipe: Bool,
        animated: Bool, completion: (() -> Void)?
    )
    
    /// Present sheet on the screen.
    /// - Parameters:
    ///     - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///     - view: A SwiftUIView builder to display view on sheet
    func present<content: View>(
        dismissOnSwipe: Bool,
        animated: Bool, completion: (() -> Void)?,
        @ViewBuilder view: () -> content
    )
    
    /// Present sheet on the screen.
    /// - Parameters:
    ///     - viewController: An UIViewController to display on sheet
    ///     - dismissOnSwipe: Pass true to dismiss the presentation on swipe-down; otherwise, pass false.
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func present(
        viewController: UIViewController, dismissOnSwipe: Bool,
        animated: Bool, completion: (() -> Void)?
    )
    
    /// dismiss sheet or alert on the screen.
    /// - Parameters:
    ///     - animated: Pass true to animate the presentation; otherwise, pass false.
    ///     - completion: The block to execute after the view or view controller is dismissed. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
