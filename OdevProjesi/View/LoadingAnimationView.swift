//
//  LoadingAnimationView.swift
//  OdevProjesi
//
//  Created by Enes Yavuz on 10.08.2021.
//

import Foundation
import ANLoader
class LoadingAnimationView{
    func homepageAnimation(){
        ANLoader.pulseAnimation = true
        ANLoader.showLoading("Loading", disableUI: true)
    
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {

            ANLoader.hide()
        }
    }
}
