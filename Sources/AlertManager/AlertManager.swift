import SwiftUI

//TODO: Add navigation (if possible)
//TODO: Add Discussions in docs
//TODO: Add Summery and Discussions of class and environment object in docs
//Names: QuickSheets, iOSAlertSheets, AlertSheets , AlertifySwift, Alertify
public class AlertManager {
    public static let shared = AlertManager()

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
    public var alertManager: AlertManager {
        get {
            AlertManager.shared
        }
    }
}
