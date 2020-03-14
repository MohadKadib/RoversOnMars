//
//  MarsService.swift
//  MarsLens
//
//  Created by mohammed abdulla kadib on 3/10/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//


import RxSwift

protocol MarsServiceProtocol {
    func fetchMarsPhotos() -> Observable<[Photo]>
}

class MarsService: MarsServiceProtocol {
    
    let apiString1 = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=DEMO_KEY"
    
    let apiString2 = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY"
    
    
    //Function to fetch the photos from the API and return them as an observableObject
    func fetchMarsPhotos() -> Observable<[Photo]> {
        
        return Observable.create { (observer) -> Disposable in
            
            let task1 = URLSession.shared.dataTask(with:URL(string: self.apiString1)!) { (data, _, _) in
                
                
                guard let Mydata = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    
                    let tempMarsPhotos = try JSONDecoder().decode(MarsPhotoCollection.self, from: Mydata)
                    let marsPhotos = tempMarsPhotos.photos
                    observer.onNext(marsPhotos)
                    
                } catch {
                    observer.onError(error)
                }
                
            }
            
            task1.resume()
            
            return Disposables.create{
                task1.cancel()
            }
            
        }
        
    }
    
}
