//
//  ImageDetailsViewController.swift
//  RoversOnMars
//
//  Created by mohammed abdulla kadib on 3/11/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit
import SDWebImage


class ImageDetailsViewController: UIViewController, Storyboarded {
    
    
    
    @IBOutlet weak var marsDetailImageView: UIImageView!
   
    
    @IBOutlet weak var roverName: UILabel! 
    
    @IBOutlet weak var lunchDate: UILabel!
    

    @IBOutlet weak var landDate: UILabel!
    
    var launch: String = ""
    var land: String = ""
    var rover: String = ""
    var image: String = ""
    
    
    weak var coordinator: Coordinator?

        

    override func viewDidLoad() {
        super.viewDidLoad()
        

        roverName.text = rover
        lunchDate.text = launch
        landDate.text = land
        
        
        marsDetailImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "mars.png") )
        
    }
    
    
    

    

}
