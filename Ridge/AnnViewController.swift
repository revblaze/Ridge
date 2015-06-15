//
//  AnnViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-11.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit

class AnnViewController: UIViewController {

    // Create WebView for IRHS Announcements
    @IBOutlet var webView: UIWebView!
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Announcements URL
        UIWebView.loadRequest(webView)(NSURLRequest(URL: NSURL(string: "http://irs.hdsb.ca/announcements/")!))
        webView.backgroundColor = UIColor.clearColor()
    }    
}
