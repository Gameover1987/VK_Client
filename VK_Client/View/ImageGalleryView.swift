
import SwiftUI

struct ImageGalleryView: View {
    
    @ObservedObject var photoGalleryViewModel = PhotoGalleryViewModel(vkApi: VkApi.shared)
    
    var body: some View {
        VStack {
            
        }.onAppear {
            photoGalleryViewModel.load()
        }
    }
}

struct ImageGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGalleryView()
    }
}
