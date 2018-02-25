//
//  Feed.swift
//  EduSafeV2
//
//  Created by Andrew Song on 2/25/18.
//  Copyright © 2018 zav. All rights reserved.
//

import Foundation

class FeedObjects: Decodable{

    private let approved: Bool
    private let content: String
    private let id: Int
    private let resolved: Bool
    private let school: Int
    private let urgent: Int

    private enum CodingKeys: String, CodingKey{

        case approved
        case content
        case id
        case resolved
        case school
        case urgent
    }

    init(approved: Bool, content: String, id: Int, resolved: Bool, school: Int, urgent: Int) {
        self.approved = approved
        self.content = content
        self.id = id
        self.resolved = resolved
        self.school = school
        self.urgent = urgent
    }

    func getApproved() -> Bool{
        return approved
    }
    func getContent() -> String{
        return content
    }
    func getID() -> Int{
        return id
    }
    func getResolved() -> Bool{
        return resolved
    }
    func getSchool() -> Int{
        return school
    }
    func getUrgent() -> Int{
        return urgent
    }

}
