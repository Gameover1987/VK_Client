
import Foundation

protocol ViewModelFactoryProtocol {
    func getPosts(by newsfeed: Newsfeed) -> [PostViewModel]
    
    func getFriend(by friend: Friend) -> FriendViewModel
}

final class ViewModelFactory : ViewModelFactoryProtocol {
    
    static let shared = ViewModelFactory()
    
    private init() {
        
    }
    
    func getPosts(by newsfeed: Newsfeed) -> [PostViewModel] {
        let posts = newsfeed.items.filter { post in
            if (post.type == "post") {
                return true
            }
            return false
        }
        
        var postViewModels: [PostViewModel] = []
        
        for post in posts {
            
            if (post.sourceId > 0) {
                let profile = newsfeed.profiles.first { profileInfo in
                    return profileInfo.id == post.sourceId
                }
                if (profile != nil) {
                    postViewModels.append(PostViewModel(post, from: profile!))
                }
            } else {
                let group = newsfeed.groups.first { groupInfo in
                    return groupInfo.id == abs(post.sourceId)
                }
                if (group != nil) {
                    postViewModels.append(PostViewModel(post, from: group!))
                }
            }
        }
        
        return postViewModels
    }
    
    func getFriend(by friend: Friend) -> FriendViewModel {
        return FriendViewModel(friend: friend)
    }
}
