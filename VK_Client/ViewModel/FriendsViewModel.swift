
import Foundation

final class FriendsViewModel : ObservableObject {
    
    private let vkApi: any VkApiProtocol
    
    @Published var friends: [Friend] = []
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    func load() {
        vkApi.getFriends { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let friends):
                self.friends = friends
            }
        }
    }
    
}
