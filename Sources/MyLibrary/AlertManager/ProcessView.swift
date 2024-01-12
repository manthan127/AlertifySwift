//
//  File.swift
//  
//
//  Created by PC on 12/01/24.
//

import UIKit

//MARK: Process view
extension AlertManager {
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
}
