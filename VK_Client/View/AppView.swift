
import SwiftUI

struct AppView: View {
    
    @ObservedObject var friendsViewModel = FriendsViewModel(vkApi: VkApi.shared)
    
    var body: some View {
        TabView {
            
            ProfileView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                }
            
            ScrollView {
                
            }.tabItem {
                Image(systemName: "message")
            }
            
            ScrollView {
                
            }.tabItem {
                Image(systemName: "photo")
            }
            
            ScrollView {
                
            }.tabItem {
                Image(systemName: "video")
            }
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(VkApi.shared)
    }
}
