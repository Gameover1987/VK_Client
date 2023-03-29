
import Foundation

final class PhotoGalleryViewModel : ObservableObject {
    private let vkApi: any VkApiProtocol
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    @Published var photos: [PhotoViewModel] = []
    
    func load() {
        vkApi.getPhotos { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photos):
                self.photos = photos.map({ photo in
                    return PhotoViewModel(photo: photo)
                })
            }
        }
    }
}
