//
//  IssueModel.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/19/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation

public struct IssueModel : Codable {
    public let assignee : AssigneeModel?
    public let assignees : [AssigneeModel]?
    public let body : String?
    public let closedAt : String?
    public let comments : Int?
    public let commentsUrl : String?
    public let createdAt : String?
    public let eventsUrl : String?
    public let htmlUrl : String?
    public let id : Int?
    public let labels : [LabelModel]?
    public let labelsUrl : String?
    public let locked : Bool?
    public let milestone : MilestoneModel?
    public let number : Int?
    public let pullRequest : PullRequestModel?
    public let repository : RepositoryModel?
    public let repositoryUrl : String?
    public let state : String?
    public let title : String?
    public let updatedAt : String?
    public let url : String?
    public let user : AssigneeModel?
    
    
    enum CodingKeys: String, CodingKey {
        case assignee
        case assignees
        case body
        case closedAt = "closed_at"
        case comments
        case commentsUrl = "comments_url"
        case createdAt = "created_at"
        case eventsUrl = "events_url"
        case htmlUrl = "html_url"
        case id
        case labels
        case labelsUrl = "labels_url"
        case locked
        case milestone
        case number
        case pullRequest = "pull_request"
        case repository
        case repositoryUrl = "repository_url"
        case state
        case title
        case updatedAt = "updated_at"
        case url
        case user
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assignee = try values.decodeIfPresent(AssigneeModel.self, forKey: .assignee)
        assignees = try values.decodeIfPresent([AssigneeModel].self, forKey: .assignees)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        closedAt = try values.decodeIfPresent(String.self, forKey: .closedAt)
        comments = try values.decodeIfPresent(Int.self, forKey: .comments)
        commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        labels = try values.decodeIfPresent([LabelModel].self, forKey: .labels)
        labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
        locked = try values.decodeIfPresent(Bool.self, forKey: .locked)
        milestone = try values.decodeIfPresent(MilestoneModel.self, forKey: .milestone)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        pullRequest = try values.decodeIfPresent(PullRequestModel.self, forKey: .pullRequest)
        repository = try values.decodeIfPresent(RepositoryModel.self, forKey: .repository)
        repositoryUrl = try values.decodeIfPresent(String.self, forKey: .repositoryUrl)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        user = try values.decodeIfPresent(AssigneeModel.self, forKey: .user)
    }
}

