//
//  AlertManager.swift
//  chatApp
//
//  Created by PC on 14/12/23.
//

import SwiftUI

//TODO: Add navigation (if possible)
@available(iOS 13.0, *)
class AlertManager {
    public static let shared = AlertManager()

    private var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        var rootVC = windowScene?.windows.first?.rootViewController
        while let vc = rootVC?.presentedViewController {
            rootVC = vc
        }
        return rootVC
    }

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
    
    //MARK: Show Error in alertView
    public func presentError(_ message: String, animated: Bool = true, completion: (() -> Void)? = nil) {
        let alert = UIAlertController()
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.removeProcessView()
        }
        alert.addAction(ok)
        alert.message = message
//        alert.present(rootViewController!, animated: animated)
        rootViewController?.present(alert, animated: animated, completion: completion)
    }

    public func presentError(_ error: Error, animated: Bool = true, completion: (() -> Void)? = nil) {
        presentError(error.localizedDescription, animated: animated, completion: completion)
    }

    //MARK: Process view
    private let processView = UIView()
    private let activityView = UIActivityIndicatorView()
    public func showProcessView() {
        guard let view = rootViewController?.view else {return}
        view.addSubview(processView)
        activityView.startAnimating()
        view.addConstraints([
            processView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            processView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    public func removeProcessView() {
        activityView.stopAnimating()
        processView.removeFromSuperview()
    }

    // MARK: present sheet
    public func present<content: View>(_ view: content, animated: Bool = true, modalInPresentation: Bool = false, completion: (() -> Void)? = nil) {
        let vc = UIHostingController(rootView: view)
        present(vc, animated: animated, modalInPresentation: modalInPresentation, completion: completion)
    }

    public func present(_ viewController: UIViewController, animated: Bool = true, modalInPresentation: Bool = false, completion: (() -> Void)? = nil) {
        viewController.isModalInPresentation = modalInPresentation
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    public func dismiss(completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: true, completion: completion)
    }
}
