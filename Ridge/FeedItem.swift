//
//  FeedItem.swift
//  Ridge
//
//  Created by Justin Bush on 2015-05-29.
//  Copyright (c) 2015 Justin Bush. All rights reserved.
//

import UIKit

class FeedItem {
    
    var item: MWFeedItem!
    var imageLink: String = ""
    
    init (item: MWFeedItem, imageLink: String) {
        self.item = item
        self.imageLink = imageLink
    }
}
