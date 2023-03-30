
import Foundation

final class PhotoGalleryViewModel : ObservableObject {
    private let vkApi: any VkApiProtocol
    
    private var offset = 0;
    private var count = 20;
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    @Published var photos: [PhotoViewModel] = []
    
    func load() {
        
        vkApi.getPhotos(offset: self.offset, count: self.count) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photos):
                self.photos = photos.map({ photo in
                    return PhotoViewModel(photo: photo)
                })
            }
            
            self.offset += self.count
        }
    }
}
