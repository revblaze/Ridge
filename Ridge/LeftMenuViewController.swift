//
//  LeftMenuViewController.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-11.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit
import Foundation

class LeftMenuViewController: UIViewController {
    
    // Setup Side Menu TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.frame = CGRectMake(20, (self.view.frame.size.height - 54 * 5) / 2.0, self.view.frame.size.width, 54 * 5)
        tableView.autoresizingMask = .FlexibleTopMargin | .FlexibleBottomMargin | .FlexibleWidth
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.opaque = false
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
        }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        view.addSubview(tableView)
        
        // Listen for showLeftMenu sender
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showLeftMenu", name: "showLeftMenu", object: nil)
        
        }
    
    func showLeftMenu() {
        sideMenuViewController?.presentLeftMenuViewController()
    }
}


// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let titles: [String] = ["Home", "About", "Announcements", "Ridge Social" /* "Teacher Contact" */]
        let images: [String] = ["HomeIcon", "AboutIcon", "AnnIcon", "SocialIcon" /* "ContactIcon" */]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 21)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .None
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.row {
        case 0:
            sideMenuViewController?.contentViewController = storyBoard.instantiateViewControllerWithIdentifier("ViewController") as? UIViewController
            sideMenuViewController?.hideMenuViewController()
            break
        case 1:
            sideMenuViewController?.contentViewController = storyBoard.instantiateViewControllerWithIdentifier("AboutViewController") as? UIViewController
            sideMenuViewController?.hideMenuViewController()
            break
        case 2:
            sideMenuViewController?.contentViewController = storyBoard.instantiateViewControllerWithIdentifier("AnnViewController") as? UIViewController
            sideMenuViewController?.hideMenuViewController()
            break
        case 3:
            sideMenuViewController?.contentViewController = storyBoard.instantiateViewControllerWithIdentifier("SocialViewController") as? UIViewController
            sideMenuViewController?.hideMenuViewController()
            break
            /*
        case 4:
            sideMenuViewController?.contentViewController = storyBoard.instantiateViewControllerWithIdentifier("ContactViewController") as? UIViewController
            sideMenuViewController?.hideMenuViewController()
            break
            */
        default:
            break
        }
        
        
    }
    
}
    