//
//  PullRequestModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

public struct PullRequestModel : Codable {
     let diff_url : String?
     let html_url : String?
     let patch_url : String?
     let url : String?
}

