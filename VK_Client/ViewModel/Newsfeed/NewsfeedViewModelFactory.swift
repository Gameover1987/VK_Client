
import Foundation

protocol NewsfeedViewModelFactoryProtocol {
    func getPosts(by newsfeed: Newsfeed) -> [PostViewModel]
}

final class NewsfeedViewModelFactory : NewsfeedViewModelFactoryProtocol {
    
    static let shared = NewsfeedViewModelFactory()
    
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
    
}
