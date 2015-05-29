//
//  ViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-04-30.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit

// Ridge Blog RSS URL
let TEST_URL = "http://feeds.feedburner.com/blogspot/TFqyUj"

// Initiate Class ViewController with MWFeedParser as a Delegate
class ViewController: UIViewController, MWFeedParserDelegate {
    
    // Create an array of FeedItems
    var items = [FeedItem]()
    @IBOutlet var tbView : UITableView!
    
    // ViewController ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    // Request RSS URL content and remove existing ones
    func request() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        items.removeAll(keepCapacity: false)
        let URL = NSURL(string: TEST_URL)
        let feedParser = MWFeedParser(feedURL: URL);
        feedParser.delegate = self
        feedParser.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

