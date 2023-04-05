

import Foundation

struct NewsfeedResponse : Decodable {
    var response: Newsfeed
}

struct Newsfeed : Decodable {
    
    var items: [Post]
    
    var profiles: [ProfileInfo]
    
    var groups: [GroupInfo]
    
    var nextFrom: String
    
    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
}

struct Post : Decodable {
    var type: String
    
    var sourceId: Int
    
    var unixDate: Int
    
    var text: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case sourceId = "source_id"
        case unixDate = "date"
        case text
    }
}

struct ProfileInfo : Decodable {
    var id: Int
    
    var sex: Int
    
    var firstName: String
    
    var lastName: String
    
    var photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sex
        case firstName = "first_name"
        case lastName = "last_name"
        case photoUrl = "photo_100"
    }
}

struct GroupInfo : Decodable {
    var id: Int
    
    var name: String
    
    var photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photoUrl = "photo_100"
    }
}
