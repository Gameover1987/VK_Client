
import Foundation

final class PhotoGalleryViewModel : ObservableObject {
    private let vkApi: any VkApiProtocol
    
    private var offset = 0;
    private var count = 20;
    
    private var isLoaded = false
    
    init (vkApi: any VkApiProtocol) {
        self.vkApi = vkApi
    }
    
    @Published var photos: [PhotoViewModel] = []
    
    func load() {
        
        if (isLoaded) {
            return
        }
        
        offset += count
        print("Offset = \(offset), Count = \(count)")
        
        vkApi.getPhotos(offset: self.offset, count: self.count) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let photos):
                if (photos.isEmpty) {
                    self.isLoaded = true
                    return
                }
                
                self.photos += photos.map({ photo in
                    return PhotoViewModel(photo: photo)
                })
            }
        }
    }
}
