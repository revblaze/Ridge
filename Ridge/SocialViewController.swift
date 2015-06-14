//
//  SocialViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-14.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit
import TwitterKit

class SocialViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = Twitter.sharedInstance().APIClient
        self.dataSource = TWTRUserTimelineDataSource(screenName: "fabric", APIClient: client)
    }
}
