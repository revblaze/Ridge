//
//  MyTableViewCell.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-31.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var FeedLbl: UILabel!
    @IBOutlet var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
