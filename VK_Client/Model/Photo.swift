
import Foundation

struct PhotoResponse : Decodable {
    let response: Photos
}

struct Photos : Decodable {
    let count: Int
    let items: [Photo]
}

struct Photo : Decodable {
    var id: Int
    
    var albumId: Int

    var date: Int

    var ownerId: Int

    var text: String

    var sizes: [ImageSize]

    enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case date
        case ownerId = "owner_id"
        case text
        case sizes
    }
}

struct ImageSize : Decodable {
    var width: Int
    
    var height: Int
    
    var type: String
    
    var url: String
}
