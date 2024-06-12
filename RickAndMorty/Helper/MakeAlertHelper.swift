//
//  MakeAlertHelper.swift
//  GenericNetworkLayer
//
//  Created by Ahmet Tunahan Bekdaş on 4.06.2024.
//

import UIKit

enum MakeAlertHelper {
    static func alertMassage(action: String, title: String, message: String, style: UIAlertController.Style, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: action, style: .default)
        alert.addAction(alertAction)
        vc.present(alert, animated: true)
    }
}

