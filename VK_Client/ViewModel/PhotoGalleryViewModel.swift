
import Foundation

final class PhotoGalleryViewModel : ObservableObject {
    private let vkApi: any VkApiProtocol
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    func load() {
        vkApi.getPhotos { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photos):
                print(photos)
            }
        }
    }
}
