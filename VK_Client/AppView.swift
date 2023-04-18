
import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            
            NewsfeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                }
            
            PhotoGalleryView()
                .tabItem {
                    Image(systemName: "photo")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(VkApi.shared)
    }
}
