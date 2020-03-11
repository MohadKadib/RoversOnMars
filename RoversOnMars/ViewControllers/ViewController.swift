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

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: Coordinator?
    
    let disposeBag = DisposeBag()
    
    private var viewModel: MarsListViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MarsListViewModel()
        viewModel.fetchMarsPhotoViewModels().observeOn(MainScheduler.instance).bind(to:
        tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            let marsCell = cell as! TableViewCell
            marsCell.roverNameLabel.text = viewModel.displayRoverName
            marsCell.CameraTypeLabel.text = viewModel.displayCameraName
            marsCell.picDateLabel.text = viewModel.displayPicDate
            marsCell.marsImageDisplay.sd_setImage(with: URL(string: viewModel.displayImage), placeholderImage: UIImage(named: "mars.png"))
            
            
        }.disposed(by: disposeBag)
        
    }


}

