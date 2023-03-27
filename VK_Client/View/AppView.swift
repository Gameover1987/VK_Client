
import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
            ScrollView {
                
            }.tabItem {
                Image(systemName: "message")
            }
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                }
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(VkApi.shared)
    }
}
