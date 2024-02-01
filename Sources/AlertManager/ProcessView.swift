import UIKit

//MARK: Process view
public extension AlertManager {
    func showProcessView() {
        guard let view = rootViewController?.view else {return}
        view.addSubview(processView)
        activityView.startAnimating()
        view.addConstraints([
            processView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            processView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func removeProcessView() {
        activityView.stopAnimating()
        processView.removeFromSuperview()
    }
}
