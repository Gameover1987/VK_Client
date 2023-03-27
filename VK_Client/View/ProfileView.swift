
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel = ProfileViewModel(vkApi: VkApi.shared)
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: profileViewModel.photo))
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            HStack {
                Text(profileViewModel.firstName)
                    .font(.system(size:20, weight: .black))
                Text(profileViewModel.lastName)
                    .font(.system(size:20, weight: .black))
            }
            HStack {
                Text(profileViewModel.locationInfo)
                    .font(.system(size:12, weight: .light))
            }
            HStack {
                Text(profileViewModel.status)
            }.padding(.top, 10)
        }.onAppear {
            profileViewModel.load()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
