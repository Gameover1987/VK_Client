
import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var vkApi = VkApi.shared
    
    var body: some View {
        if vkApi.authorizationInfo != nil {
            AppView()
                .environmentObject(vkApi)
        } else {
            WebPageView(authorizationInfo: $vkApi.authorizationInfo)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
