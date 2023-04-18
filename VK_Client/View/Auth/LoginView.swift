
import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var vkApi = VkApi.shared
    
    var body: some View {
        if vkApi.authorizationInfo != nil {
            AppView()
                .environmentObject(vkApi)
        } else {
            ZStack {
                WebPageView(authorizationInfo: $vkApi.authorizationInfo)
      
                LoadingView(isShowing: $vkApi.isLoading, message: "Загрузка...") {
                    EmptyView()
                }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
