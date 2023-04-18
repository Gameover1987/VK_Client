
import Foundation

final class FriendViewModel : Identifiable {
    private let friend: Friend
    
    init (friend: Friend) {
        self.friend = friend
    }
    
    var id: String {
        return friend.id
    }
    
    var ava: String {
        return friend.photo
    }
    
    var photo: String {
        return friend.bigPhoto
    }
    
    var firstName: String {
        return friend.firstName
    }
    
    var lastName: String {
        return friend.lastName
    }
    
    var status: String {
        return friend.status ?? ""
    }
    
    var locationInfo : String {
        if (friend.city == nil && friend.country == nil) {
            return ""
        }
        
        if  (friend.city != nil && friend.country != nil) {
            return "\(friend.city!.title), \(friend.country!.title)"
        }
        
        if (friend.city != nil) {
            return friend.city!.title
        }
        
        if (friend.country != nil) {
            return friend.country!.title
        }
        
        return ""
    }
}
