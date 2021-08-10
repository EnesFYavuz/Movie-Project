//
//  CheckInternetConnection.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 6.08.2021.
//

import Foundation
import Network
import UIKit

class CheckInternetConnection{

    
    func monitorNetwork(viewController: UIViewController){
        let monitor = NWPathMonitor( )
        monitor.pathUpdateHandler={
            path in if path.status == .satisfied{
                DispatchQueue.main.async {
                    LoadingAnimationView().homepageAnimation()
                }
            }else{
                DispatchQueue.main.async{
                    self.Alert(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", viewController:viewController )
            }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
    
    func Alert(title:String,message:String,viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        viewController.present(alert, animated: true, completion: nil)
        
    }
}
