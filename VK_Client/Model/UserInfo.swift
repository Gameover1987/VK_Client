
import Foundation

struct UserResponse : Decodable {
    let response: [UserInfo]
}

struct City : Identifiable, Decodable {
    var id: Int
    
    var title: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
    }
}

struct Country : Identifiable, Decodable {
    var id: Int
    
    var title: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
    }
}

struct UserInfo : Identifiable, Decodable {
    var id: Int
    
    var status: String
    
    var firstName: String
    
    var lastName: String
    
    var birthdate: String
    
    var photo: String
    
    var city: City
    
    var country: Country
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case firstName = "first_name"
        case lastName = "last_name"
        case birthdate = "bdate"
        case photo = "photo_200"
        case city
        case country
    }
}
