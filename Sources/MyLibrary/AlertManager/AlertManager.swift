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