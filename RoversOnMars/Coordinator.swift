//
//  Coordinator.swift
//  RoversOnMars
//
//  Created by mohammed abdulla kadib on 3/11/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//


import UIKit

class Coordinator {
    
    var navigatoinController: UINavigationController
    
    init(navigatoinController: UINavigationController) {
        
        self.navigatoinController = navigatoinController
        
    }
    
    func Start() {
        
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigatoinController.pushViewController(vc, animated: false)
        
    }
    
    func goToImageDetail() {
        
        let vc = ImageDetailsViewController.instantiate()
        vc.coordinator = self
        navigatoinController.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
}
