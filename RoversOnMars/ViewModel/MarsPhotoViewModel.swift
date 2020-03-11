//
//  MarsPhotoViewModel.swift
//  MarsLens
//
//  Created by mohammed abdulla kadib on 3/10/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit

struct MarsPhotoViewModel {
    
    
    private let marsPhoto: Photo
    
    var displayRoverName: String {
        return marsPhoto.rover.name
    }
    
    var displayCameraName: String{
        return marsPhoto.camera.name
    }
    
    var displayPicDate: String {
        return marsPhoto.earth_date
    }
    
    var displayImage: String {
        return marsPhoto.img_src
    }
    
    
    
    init(marsPhoto: Photo) {
        
        self.marsPhoto = marsPhoto

    }
    
}
