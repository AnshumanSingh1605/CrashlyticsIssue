//
//  LabelModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

public struct LabelModel : Codable {
    public let color : String?
    public let defaultField : Bool?
    public let id : Int?
    public let name : String?
    public let url : String?
    
    enum CodingKeys: String, CodingKey {
        case color
        case defaultField = "default"
        case id
        case name
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        defaultField = try values.decodeIfPresent(Bool.self, forKey: .defaultField)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
