//
//  DetailViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-29.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit
import QuartzCore

class DetailViewController: UIViewController {

    // FeedItem setup display
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var contentWebView: UIWebView!
    @IBOutlet var imageView: UIImageView!
    
    // Setup FeedItem for parsing
    var feedItem: FeedItem!
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom UIBackBarButtonItem for Navigation
        let backItem = UIBarButtonItem(image: UIImage(named: "BackButtonIcon"), style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        backItem.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = backItem
        
        // FeedItem title
        titleLbl.text = feedItem.item.title
        
        // Parse and load HTML from FeedBurner
        var htmlString = feedItem.item.summary
        contentWebView.loadHTMLString(htmlString, baseURL: nil)
        
        // Placeholder image for articles without media
        imageView.setImageWithURL(NSURL(string: feedItem.imageLink), placeholderImage: UIImage(named: "Placeholder"))
        
        // Dim article media cover
        var layer = CALayer()
        layer.frame = imageView.frame
        layer.backgroundColor = UIColor.blackColor().CGColor
        imageView.layer.mask = layer
        imageView.layer.opacity = 0.8
        imageView.alpha = 0.5
    }
    
    // Open feed URL in Safari
    @IBAction func openLink(sender: AnyObject!) {
        UIApplication.sharedApplication().openURL(NSURL(string: feedItem.item.link)!)
    }

    // Add functionality to custom UIBackBarButtonItem
    func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
