//
//  Request.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation
import Alamofire

class APIRequest {
    
    class func issues () -> URLRequest {
        let issuesURL =  baseUrl + "/repos/firebase/firebase-ios-sdk/issues"
        
        var parameters = [String : String]()
        parameters["filter"] = IssueFilter.assigned.rawValue
        parameters["state"] = IssueState.open.rawValue
        parameters["sort"] = IssueSort.updated.rawValue
        parameters["direction"] = IssueDirection.desc.rawValue
        
        //all the required parameters are added as the query parameter with the URLRequest.
        var urlcomponenst = URLComponents.init(string: issuesURL)
        urlcomponenst?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value) }
        let query = urlcomponenst?.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        urlcomponenst?.percentEncodedQuery = query
        
        let issuesRequest = getDesiredURLRequest(url: (urlcomponenst?.url)!, method: .get, token: nil)
        if let request = issuesRequest {
            return request
        }
        return URLRequest.init(url: .init(fileURLWithPath: "", isDirectory: false))
    }
    
    class func comments (comment url : String) -> URLRequest {
        if let commentsRequest = getDesiredURLRequest(url: url, method: .get, token: nil) {
            return commentsRequest
        }
        return URLRequest.init(url: .init(fileURLWithPath: "", isDirectory: false))
    }
    
    //MARK :- Get URLRequest
    //This method is used to create the URLRequest with url in string format.
    private class func getDesiredURLRequest(url requestedFor : String ,method : HTTPMethod , token : String?) -> URLRequest? {
        do {
            var urlRequested = try URLRequest.init(url: requestedFor, method: method, headers: defaultHeaders)
            if let _token = token {
                urlRequested.addValue(_token, forHTTPHeaderField: "Authorization")
            }
            return urlRequested
        } catch let error {
            print("Unable to create a valid URLRequest ::-- \(error)")
            return nil
        }
    }
    
    //This method is used to create the URLRequest with query parameters
    private class func getDesiredURLRequest(url requestedFor : URL ,method : HTTPMethod , token : String?) -> URLRequest? {
        do {
            var urlRequested = try URLRequest.init(url: requestedFor, method: method, headers: defaultHeaders)
            if let _token = token {
                urlRequested.addValue(_token, forHTTPHeaderField: "Authorization")
            }
            return urlRequested
        } catch let error {
            print("Unable to create a valid URLRequest ::-- \(error)")
            return nil
        }
    }
    
}
