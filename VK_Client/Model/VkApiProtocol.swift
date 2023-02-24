
import Foundation
import Alamofire

protocol VkApiProtocol : ObservableObject {
    
    var authorizationInfo: AuthorizationInfo? {get set}
    
    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void)
}

struct AuthorizationInfo {
    let token: String
    
    let userId: Int
    
    let expiresIn: Int
}

final class VkApi : ObservableObject, VkApiProtocol {
    
    static let shared = VkApi()
    
    private init() { }
    
    @Published var authorizationInfo: AuthorizationInfo?
    
    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        guard let authorizationInfo = authorizationInfo else {return}
        
        let url = "https://api.vk.com/method/friends.get"
        
        let params: Parameters = [
            "access_token": authorizationInfo.token,
            "fields": "photo_50",
            "v": "5.131"
        ]
        
        AF.request(url, method: .post, parameters: params).response { result in
            
            if let error = result.error {
                print(error)
                completion(.failure(error))
            }
            
            guard let data = result.data else {return}
     
            do {
                let decoder = JSONDecoder()
                let friends = try decoder.decode(FriendResponse.self, from: data).response.items
                completion(.success(friends))
            }
            catch(let error) {
                print(error.localizedDescription)
            }
      
        }
    }
}
