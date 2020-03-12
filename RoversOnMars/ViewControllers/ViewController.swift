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
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        
        viewModel = MarsListViewModel()
        
        bindDateToTable()
        
        
        
    }
    
    
    //MARK: - Data Binding Functions
    
    func bindDateToTable() {
        
        viewModel.fetchMarsPhotoViewModels().observeOn(MainScheduler.instance).bind(to:
        tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            let marsCell = cell as! TableViewCell
            marsCell.roverNameLabel.text = viewModel.displayRoverName
            marsCell.CameraTypeLabel.text = viewModel.displayCameraName
            marsCell.picDateLabel.text = viewModel.displayPicDate
            marsCell.marsImageDisplay.sd_setImage(with: URL(string: viewModel.displayImage), placeholderImage: UIImage(named: "mars.png"))
            
            
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(MarsPhotoViewModel.self).subscribe(onNext: { (viewModel) in
            
            
            self.coordinator?.goToImageDetail(imageSource: viewModel.displayImage, myLaunchDate: viewModel.displayLaunchDate, myLandDate: viewModel.displayLandDate, myRoverName: viewModel.displayRoverName)
            
        
            
        }).disposed(by: disposeBag)
        
        
    }
    

    
    
    
    
    
    
    
    
    


}

