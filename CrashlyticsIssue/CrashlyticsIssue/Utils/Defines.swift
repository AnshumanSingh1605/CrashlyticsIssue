//
//  Defines.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/21/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

//key to save timestamp when the data is saved in the db.
let key_TIMESTAMP = "TIMESTAMP"

//default header required in the request
let defaultHeaders = [
    "Accept" : "application/vnd.github.v3+json",
    "Content-Type" : "application/json; charset=utf-8"
]
let baseUrl = "https://api.github.com"

//to notify,wheather the data needs to be updated
func checkToUpdateData() -> Bool {
    let lastUpdateTime = UserDefaults.standard.object(forKey: key_TIMESTAMP) as? Date ?? Date()
    let components = Calendar.current.dateComponents([.hour, .minute], from: lastUpdateTime, to: Date())
    //if time difference is greater than 23 hours
    if components.hour ?? 0 > 23 {
        return true
    }
    return false
}

//Enums to define the request query parameter.
public enum IssueFilter: String {
    case assigned
    case created
    case mentioned
    case subscribed
    case all
}

public enum IssueState: String {
    case open
    case closed
    case all
}

public enum IssueSort: String {
    case created
    case updated
    case comments
}

public enum IssueDirection: String {
    case asc
    case desc
}
