
import Foundation

final class PostViewModel : ObservableObject, Identifiable {
    
    init (_ post: Post, from profile: ProfileInfo) {
        self.url = profile.photoUrl
        
        self.title = profile.firstName
        if (!profile.lastName.isEmpty) {
            self.title += " " + profile.lastName
        }
        
        self.text = post.text ?? ""
        self.date = post.unixDate.toDate()
    }
    
    init (_ post: Post, from group: GroupInfo) {
        self.url = group.photoUrl
        self.title = group.name
        self.text = post.text ?? ""
        self.date = post.unixDate.toDate()
    }
    
    var id: UUID = UUID()
    
    var url: String
    
    var title: String
    
    var text: String
    
    var date: Date
    
    var debugDescription: String {
        return "title = \(title), date = \(date), text = \(text)"
    }
}
