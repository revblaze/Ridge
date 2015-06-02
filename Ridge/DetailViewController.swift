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

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var contentWebView: UIWebView!
    @IBOutlet var imageView: UIImageView!
    
    var feedItem: FeedItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = feedItem.item.title
        
        var htmlString = feedItem.item.summary
        contentWebView.loadHTMLString(htmlString, baseURL: nil)
        
        imageView.setImageWithURL(NSURL(string: feedItem.imageLink), placeholderImage: UIImage(named: "Placeholder"))
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
