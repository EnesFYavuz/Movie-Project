//
//  AlertView.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 14.08.2021.
//

import Foundation
import UIKit
class Alert{
    func Alert(title:String,message:String,viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        viewController.present(alert, animated: true, completion: nil)
        
    }
    func exitAlert(title:String,message:String,viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let exitApp = UIAlertAction(title: "Ok", style: .destructive) {
                   (alert) -> Void in
                       UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
               }
        alert.addAction(exitApp)
        viewController.present(alert, animated: true, completion: nil)
        
    }
}
