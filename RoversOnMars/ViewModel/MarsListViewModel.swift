//
//  MarsListViewModel.swift
//  MarsLens
//
//  Created by mohammed abdulla kadib on 3/10/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import Foundation
import RxSwift

final class MarsListViewModel {
    
    
    private let marsService: MarsServiceProtocol
    
    init(marsService: MarsServiceProtocol = MarsService()) {
        self.marsService = marsService
        
    }
    
    func fetchMarsPhotoViewModels() -> Observable <[MarsPhotoViewModel]> {
        
        
        marsService.fetchMarsPhotos().map { $0.map { MarsPhotoViewModel(marsPhoto: $0) }  }
        
    }
}
