
import Foundation

final class NewsfeedViewModel : ObservableObject {
    
    private let vkApi: any VkApiProtocol
    private let viewModelFactory: NewsfeedViewModelFactoryProtocol
    
    @Published var posts: [PostViewModel] = []
    
    init (vkApi: any VkApiProtocol, viewModelFactory: NewsfeedViewModelFactoryProtocol ) {
        self.vkApi = vkApi
        self.viewModelFactory = viewModelFactory
    }
    
    func load() {
        vkApi.getNews { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let newsfeed):
                self.posts = self.viewModelFactory.getPosts(by: newsfeed)
            }
        }
    }
    
}
