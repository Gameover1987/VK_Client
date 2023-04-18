
import Foundation


final class FriendsViewModel : ObservableObject {

    private let vkApi: any VkApiProtocol
    private let factory: ViewModelFactoryProtocol

    @Published var friends: [FriendViewModel] = []

    init (vkApi: any VkApiProtocol, factory: ViewModelFactoryProtocol) {
        self.vkApi = vkApi
        self.factory = factory
    }

    func load() {
        vkApi.getFriends { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let friends):
                self.friends = friends.map({ friend in
                    return self.factory.getFriend(by: friend)
                })
            }
        }
    }
}
