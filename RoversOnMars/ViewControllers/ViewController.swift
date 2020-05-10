//
//  ViewController.swift
//  RoversOnMars
//
//  Created by mohammed abdulla kadib on 3/11/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, Storyboarded {
    
    @IBOutlet weak var selectRover: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: Coordinator?
    
    let disposeBag = DisposeBag()
    
    private var viewModel: MarsListViewModel!
    
   
    
    var fetchingMore = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        
        viewModel = MarsListViewModel()
        
        let list = bindDateToTable()
        
        
        
        
    }
    
    
    //MARK: - Data Binding Functions
    
    func bindDateToTable() -> Observable<[MarsPhotoViewModel]> {
        
        let list = viewModel.fetchMarsPhotoViewModels()
        list.observeOn(MainScheduler.instance).bind(to:
            
            tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                
//                self.selectRover.rx.selectedSegmentIndex.subscribe (onNext: { index1 in
//                    print(index1)
//
//                    list.asObservable().filter { value in
//                        switch index1 {
//                        case 0:
//                            return value[index].displayRoverName == "Curiosity"
//                        case 1:
//                            return value[index].displayRoverName == "Opportunity"
//                        case 2:
//                            return value[index].displayRoverName == "Spirit"
//                        default:
//                            return true
//                        }
//
//                        //print(list)
//
//                    }
//
//
//                }).disposed(by: self.disposeBag)
                
            let marsCell = cell as! TableViewCell
            
            marsCell.roverNameLabel.text = viewModel.displayRoverName
            marsCell.CameraTypeLabel.text = viewModel.displayCameraName
            marsCell.picDateLabel.text = viewModel.displayPicDate
            marsCell.marsImageDisplay.sd_setImage(with: URL(string: viewModel.displayImage), placeholderImage: UIImage(named: "mars.png"))
                
                
    
            
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(MarsPhotoViewModel.self).subscribe(onNext: { (viewModel) in
            
            self.coordinator?.goToImageDetail(imageSource: viewModel.displayImage, myLaunchDate: viewModel.displayLaunchDate, myLandDate: viewModel.displayLandDate, myRoverName: viewModel.displayRoverName)
            
        }).disposed(by: disposeBag)
        
        
        return list
        
    }
    

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHight = scrollView.contentSize.height
        
        
        if offsetY > contentHight - scrollView.frame.height {
            
            if !fetchingMore {
                beginBatchFetch()
            }
            
        }
        
    }
    
    func beginBatchFetch() {
        
        fetchingMore =  true
        print("Begin Batch fetch")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            // make API call for more photos
            
            
            
            self.fetchingMore = false
        }
        
    }
    
    
    
    
    


}

