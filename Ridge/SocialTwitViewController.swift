//
//  TwitterViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-15.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//
//  This class handles the TwitterKit integration.
//
import UIKit
import TwitterKit

class SocialTwitViewController: TWTRTimelineViewController {
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Layout Correction
        self.edgesForExtendedLayout = UIRectEdge.None
        
        // TwitterKit display code
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRUserTimelineDataSource(screenName: "IRHS1", APIClient: client)
            } else {
                println("error: %@", error.localizedDescription);
            }
        }
    }
    
    // Enable Left Menu Button
    @IBAction func showLeftMenu(sender: AnyObject) {
        sideMenuViewController?.presentLeftMenuViewController()
    }
}
