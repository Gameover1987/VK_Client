
import Foundation

final class ProfileViewModel : ObservableObject {
    
    private let vkApi: any VkApiProtocol
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    @Published var photo: String = ""
    
    @Published var firstName: String = ""
    
    @Published var lastName: String = ""
    
    @Published var status: String = ""
    
    @Published var locationInfo = ""
    
    func load() {
        vkApi.getUserInfo { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let user):
                self.photo = user.photo
                self.firstName = user.firstName
                self.lastName = user.lastName
                self.status = user.status
                self.locationInfo = ("\(user.city.title), \(user.country.title)") 
            }
        }
    }
}
