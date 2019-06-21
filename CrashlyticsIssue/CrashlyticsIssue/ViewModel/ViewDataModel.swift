//
//  ViewDataModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/20/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

class ViewDataModel {
    
    //title to be displayed on the cell.
    var title : String?
    
    //description about the title.
    var description : String?
    
    //the url presenting the comments, only if it's an issue, for comments it will be nil.
    var comments_url : String?
    
    init(title : String, description : String,comment url : String?) {
        self.title = title
        self.description = description
        self.comments_url = url
    }
}
