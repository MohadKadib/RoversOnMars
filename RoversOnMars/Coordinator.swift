//
//  Coordinator.swift
//  RoversOnMars
//
//  Created by mohammed abdulla kadib on 3/11/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//


import UIKit
import SDWebImage

class Coordinator {
    
    var navigatoinController: UINavigationController
    
    
    init(navigatoinController: UINavigationController) {
        
        navigatoinController.navigationBar.barTintColor = UIColor.orange
        navigatoinController.navigationBar.tintColor = UIColor.white
        
        self.navigatoinController = navigatoinController
        
    }
    
    func Start() {
        
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigatoinController.pushViewController(vc, animated: false)
        
    }
    
    func goToImageDetail(imageSource: String, myLaunchDate: String, myLandDate: String, myRoverName: String) {
        
        let vc = ImageDetailsViewController.instantiate()
        
        vc.coordinator = self
        navigatoinController.pushViewController(vc, animated: true)
//        vc.viewDidLoad()
        vc.land = myLandDate
        vc.launch = myLaunchDate
        vc.rover = myRoverName
        vc.image = imageSource

    }
    
    
    
    
    
}
