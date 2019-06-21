//
//  DataHandler.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/20/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation
typealias DataList = [ViewDataModel]?

class DataHandler : NSObject {
    
    override init() {
        super.init()
    }
    
    //To fetch the issues, and send to the view controller to be presented on the View.
    func fetchIssues(completion : @escaping (_ issuesData : DataList?) -> Void) {
        //retrieving the issues data from the database.
        let list =  DBHandler.getIssuesData()
        
        if list?.count ?? 0 > 0 {
            //the values from database is send to the controller.
            completion(list)
        } else {
            //if database returns nil or an empty array, then request of Issues.
            self.getIssues { (list) in
                completion(list)
            }
        }
    }
    
    //Updating the issues data , when the database is been cleared, or the data needs to be updated in the database.
    func updateIssues() {
        getIssues {_ in }
    }
    
    //This method is used to retrieve the Issues from the server, through the API's
    func getIssues(completion : @escaping (_ issuesData : DataList?) -> Void) {
        var arrData : [ViewDataModel]?
        APIConnectionHandler.getIssues() { (success, issues : [IssueModel]?, error : Error?) in
            if let issues = issues {
                arrData = [ViewDataModel]()
                //Iterating through every issue retrieved
                for issue in issues {
                    var bodyText = issue.body ?? ""
                    //limiting the issue body to contain only 140 characters.
                    if bodyText.count > 140 {
                        bodyText = String(bodyText[bodyText.startIndex..<bodyText.index(bodyText.startIndex, offsetBy: 140)])
                    }
                    //creating a temporary view model instance, and initializing with the issues value, which is finally stored in the database.
                    let tempData = ViewDataModel.init(title: issue.title  ?? "No title", description: bodyText, comment: issue.commentsUrl)
                    
                    //saved in the database
                    DBHandler.saveToDatabase(tempData.title!, tempData.description!, comments: tempData.comments_url!)
                    
                    //appended in the array.
                    arrData?.append(tempData)
                }
                
                //Saving the TIMESTAMP, at which the values were updated in the database,
                UserDefaults.standard.set(Date(), forKey: key_TIMESTAMP)
                
                completion(arrData)
            }
        }
    }
    
    //This method is used to retrieve the Comments from the server, through the API's
    func getComments(url : String, completion : @escaping (_ commentsData : DataList?)-> Void) {
        var arrData : [ViewDataModel]?
        APIConnectionHandler.getComments(url) { (success, comments : [CommentsModel]?, error :Error?) in
            if let comments = comments {
                arrData = [ViewDataModel]()
                //Iterating through every comment retrieved
                for comment in comments {
                    //creating a temporary view model instance, and initializing with the comments value.
                    let tempData =  ViewDataModel.init(title: comment.user?.login ?? "Username Unavailable", description: comment.body ?? "No description", comment: nil)
                    
                    //appended in the array.
                    arrData?.append(tempData)
                }
                completion(arrData)
            }
        }
    }
    
    //This method is used to retrieve the Comments from the server, through the API's with a fixed issue ID, this is excuted when an comment_url doesn't contain any comments. So the dummy data of a particular issue is being dislayed.
    func getDummyCommentsData(completion : @escaping (_ commentsData : DataList?)-> Void) {
        //fixed url for issue ID:- 3228
        let comurl = "https://api.github.com/repos/firebase/firebase-ios-sdk/issues/3228/comments"
        var arrData : [ViewDataModel]?
        APIConnectionHandler.getComments(comurl) { (success, comments : [CommentsModel]?, error :Error?) in
            if let comments = comments {
                arrData = [ViewDataModel]()
                //Iterating through every comment retrieved
                for comment in comments {
                    //creating a temporary view model instance, and initializing with the comments value.
                    let tempData =  ViewDataModel.init(title: comment.user?.login ?? "Username Unavailable", description: comment.body ?? "No description", comment: nil)
                    
                    //appended in the array.
                    arrData?.append(tempData)
                }
                completion(arrData)
            }
        }
    }
}
