//
//  MarsPhoto.swift
//  MarsLens
//
//  Created by mohammed abdulla kadib on 3/10/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation


struct MarsPhotoCollection: Decodable {
    
    let photos: [Photo]
    
}

struct Photo: Decodable {
    let img_src: String
    let earth_date: String
    let camera: Camera
    let rover: Rover
}

struct Camera: Decodable{
    let name: String
    let full_name: String
}

struct Rover: Decodable {
    let name: String
    let landing_date: String
    let launch_date: String
}
