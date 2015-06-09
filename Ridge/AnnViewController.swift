//
//  AnnViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-11.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit

class AnnViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIWebView.loadRequest(webView)(NSURLRequest(URL: NSURL(string: "http://irs.hdsb.ca/announcements/")!))
        webView.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
