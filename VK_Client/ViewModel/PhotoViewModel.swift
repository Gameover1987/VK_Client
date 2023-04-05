
import Foundation

final class PhotoViewModel : ObservableObject, Identifiable {
    
    init (photo: Photo) {
        self.id = photo.id
        self.previewUrl = photo.sizes.first(where: { imageSize in
            return imageSize.type == "x"
        })?.url ?? ""
        self.largeUrl = photo.getMaxSize()?.url ?? ""
        self.text = photo.text
    }
    
    var id: Int
    
    var previewUrl: String
    
    var largeUrl: String
    
    var imageHeight = CGFloat.random(in: 100 ... 300)
    
    var hasText: Bool {
        return text != ""
    }
    
    var text: String
}
