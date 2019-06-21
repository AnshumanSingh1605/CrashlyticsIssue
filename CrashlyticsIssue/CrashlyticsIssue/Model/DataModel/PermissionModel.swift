//
//  PermissionModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

public struct PermissionModel : Codable {
     let admin : Bool?
     let pull : Bool?
     let push : Bool?
}

