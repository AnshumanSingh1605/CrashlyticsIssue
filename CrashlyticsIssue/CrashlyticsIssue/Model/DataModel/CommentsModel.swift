//
//  CommentsModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

struct CommentsModel : Codable {
    let url : String?
    let html_url : String?
    let issue_url : String?
    let id : Int?
    let node_id : String?
    let user : AssigneeModel?
    let created_at : String?
    let updated_at : String?
    let author_association : String?
    let body : String?
}

