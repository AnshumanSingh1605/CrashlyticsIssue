//
//  ListingCell.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/21/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDescription : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
