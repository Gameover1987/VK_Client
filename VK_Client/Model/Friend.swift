
import Foundation

struct FriendResponse : Decodable {
    let response: Friends
}

struct Friends : Decodable {
    let count: Int
    let items: [Friend]
}

struct Friend : Identifiable, Decodable {
    var id: String { String(userId) }
    
    var userId: Int
    
    var photo: String
    var bigPhoto: String
    var firstName: String
    var lastName: String
    
    var status: String?
    var city: City?
    var country: Country?
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case photo = "photo_50"
        case bigPhoto = "photo_200_orig"
        case firstName = "first_name"
        case lastName = "last_name"
        case status
        case city
        case country
    }
}
