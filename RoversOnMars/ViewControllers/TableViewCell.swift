//
//  TableViewCell.swift
//  RoversOnMars
//
//  Created by mohammed abdulla kadib on 3/11/20.
//  Copyright © 2020 mohammed abdulla kadib. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
        
    
 
    
    @IBOutlet weak var marsImageDisplay: UIImageView!
    
    
    @IBOutlet weak var roverNameLabel: UILabel!
    
    @IBOutlet weak var CameraTypeLabel: UILabel!
    
    @IBOutlet weak var picDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
