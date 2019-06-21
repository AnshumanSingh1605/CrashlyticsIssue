//
//  ConnectionHandler.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//


class APIConnectionHandler {
    //method to retrieve the issue from API
    class func getIssues<T:Decodable> (completion : @escaping (_ status : Bool , _ result : T?,_ error:Error?) -> Void ) -> Void {
        let issuesRequest = APIRequest.issues()
        APIConnection.hitRequest(url: issuesRequest) { (success, result, error) in
            completion(success , result, error)
        }
    }
    
    //method to retrieve the comments from API
    class func getComments<T:Decodable> (_ url : String , completion : @escaping (_ status : Bool , _ result : T?,_ error:Error?) -> Void ) -> Void {
        let commentRequest = APIRequest.comments(comment: url)
        APIConnection.hitRequest(url: commentRequest) { (success, result, error) in
            completion(success , result, error)
        }
    }
    
    
}
