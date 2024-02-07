import SwiftUI

//TODO: Add navigation (if possible)
//TODO: Add Discussions in docs
//TODO: Add Summery and Discussions of class and environment object in docs
/// An object to show popups on the screens
public class Alertify {
    /// Returns the shared Alertify object.
    public static let shared = Alertify()

    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        var rootVC = windowScene?.windows.first?.rootViewController
        while let vc = rootVC?.presentedViewController {
            rootVC = vc
        }
        return rootVC
    }

    let processView = UIView()
    let activityView = UIActivityIndicatorView()

    /// Creates a Alertify object
    public init(){
        processView.backgroundColor = .white
        processView.layer.cornerRadius = 10
        processView.layer.shadowRadius = 10
        processView.translatesAutoresizingMaskIntoConstraints = false
        activityView.translatesAutoresizingMaskIntoConstraints = false

        processView.addSubview(activityView)
        processView.addConstraints([
            processView.heightAnchor.constraint(equalToConstant: 100),
            processView.widthAnchor.constraint(equalToConstant: 100),

            activityView.centerXAnchor.constraint(equalTo: processView.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: processView.centerYAnchor)
        ])
    }
}

extension EnvironmentValues {
    /// Returns the shared Alertify object.
    public var alertify: Alertify {
        get {
            Alertify.shared
        }
    }
}