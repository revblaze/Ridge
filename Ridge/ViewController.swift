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
    
    // MWFeedParser FeedParserDidStart
    func feedParserDidStart(parser: MWFeedParser) {
        self.items = [FeedItem]()
    }
    
    // MWFeedParser FeedParserDidFinish
    func feedParserDidFinish(parser: MWFeedParser) {
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        tbView.reloadData()
    }
    
    // MWFeedParser DidParseFeed
    func feedParser(parser: MWFeedParser, didParseFeedInfo info: MWFeedInfo) {
        println(info)
        self.title = info.title
    }
    
    // MWFeedParser DidParseFeedItem
    func feedParser(parser: MWFeedParser, didParseFeedItem item: MWFeedItem) {
        println(item)
        self.items.append(FeedItem(item: item, imageLink: ""))
    }
    
    // Set TableView height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    // Set number of sections in TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Set number of rows in section in TableView, return number of RSS items
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Fill TableView with RSS content
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCellWithIdentifier("FeedCell", forIndexPath: indexPath) as! MyTableViewCell
        
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    // Configure TableViewCell for RSS Feed Items
    func configureCell(cell: MyTableViewCell, atIndexPath indexPath: NSIndexPath) {
        var feedItem = self.items[indexPath.row] as FeedItem
        cell.FeedLbl.text = feedItem.item.title
        cell.FeedLbl.font = UIFont.systemFontOfSize(14.0)
        cell.FeedLbl.numberOfLines = 0
        cell.timestamp.text = feedItem.item.date.description

        // Look for image on RSS FeedItem
        if feedItem.imageLink == "" {
            var htmlContent = feedItem.item.summary;
            
            if let regex = NSRegularExpression(pattern: "(<img.*?src=\")(.*?)(\".*?>)", options: .CaseInsensitive, error: nil) {
                if (count(htmlContent) > 0) {
                    if let match = regex.firstMatchInString(htmlContent, options: nil,
                        range: NSRange(location: 0, length: count(htmlContent))) {
                            if match.numberOfRanges > 1 {
                                var imgUrl = (htmlContent as NSString).substringWithRange(match.rangeAtIndex(2))
                                NSLog("url: %@", imgUrl)
                            if (imgUrl.lowercaseString.rangeOfString("feedburner") == nil) {
                                feedItem.imageLink = imgUrl
                                cell.img.setImageWithURL(NSURL(string: imgUrl), placeholderImage: UIImage(named: "NoImageAvailable"))
                            }
                        }
                    }
                }
            }
        }
            
        else {
            cell.img.setImageWithURL(NSURL(string: feedItem.imageLink), placeholderImage: UIImage(named: "NoImageAvailable"))
        }
    }
    
    // Enable TableView segue from Feed to FeedItem
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.items[indexPath.row] as FeedItem
        
        self.performSegueWithIdentifier("ShowDetail", sender: item)
    }
    
    // Perform segue from Feed to FeedItem
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "ShowDetail" {
            var item = sender as! FeedItem
            var vc = segue.destinationViewController as! DetailViewController
            vc.feedItem = item
        }
    }
    
    // Refresh RSS Feed and Request
    @IBAction func refresh(sender: AnyObject) {
        request()
    }

    // ViewController DidRecieveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
