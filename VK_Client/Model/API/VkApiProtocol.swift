
import Foundation
import Alamofire

protocol VkApiProtocol : ObservableObject {
    
    var authorizationInfo: AuthorizationInfo? {get set}
    
    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void)
    
    func getUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void)
    
    func getPhotos(offset: Int, count: Int, completion: @escaping (Result<[Photo], Error>) -> Void)
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
                print(error)
            }
        }
    }
    
    func getUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        guard let authorizationInfo = authorizationInfo else {return}
        
        let url = "https://api.vk.com/method/users.get"
        
        let params: Parameters = [
            "access_token": authorizationInfo.token,
            "fields": "bdate, city, country, photo_200, status",
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
                let response = try decoder.decode(UserResponse.self, from: data)
                completion(.success(response.response.first!))
            }
            catch(let error) {
                print(error)
            }
        }
    }
    
    func getPhotos(offset: Int, count: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        guard let authorizationInfo = authorizationInfo else {return}
        
        let url = "https://api.vk.com/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": authorizationInfo.token,
            "offset": offset,
            "count": count,
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
                let response = try decoder.decode(PhotoResponse.self, from: data)
                completion(.success(response.response.items))
            }
            catch(let error) {
                print(error)
            }
        }
    }
}
