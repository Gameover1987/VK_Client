
import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
            MessengerView()
                .tabItem {
                    Image(systemName: "messege")
                }
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                }
            
            PhotoGalleryView()
                .tabItem {
                    Image(systemName: "photo")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(VkApi.shared)
    }
}
