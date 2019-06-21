//
//  MilestoneModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation


public struct MilestoneModel : Codable {
     let closed_at : String?
     let closed_issues : Int?
     let created_at : String?
     let creator : AssigneeModel?
     let description : String?
     let due_on : String?
     let html_url : String?
     let id : Int?
     let labels_url : String?
     let number : Int?
     let open_issues : Int?
     let state : String?
     let title : String?
     let updated_at : String?
     let url : String?
}
