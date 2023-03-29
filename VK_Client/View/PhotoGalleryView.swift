
import SwiftUI

struct PhotoGalleryView: View {
    
    @ObservedObject var photoGalleryViewModel = PhotoGalleryViewModel(vkApi: VkApi.shared)
    
    var body: some View {
        NavigationView {
            ScrollView {
                CollectionView(items: photoGalleryViewModel.photos)
                    .navigationTitle("Фотографии")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        photoGalleryViewModel.load()
                    }
            }
        }
    }
}

struct ImageGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGalleryView()
    }
}
