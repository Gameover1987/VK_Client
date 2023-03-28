
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendsView: View {
    @ObservedObject var friendsViewModel = FriendsViewModel(vkApi: VkApi.shared)
    
    var body: some View {
        
        NavigationView {
            List(friendsViewModel.friends) { friend in
                
                NavigationLink {
                    
                } label: {
                    FriendItemView(friend: friend)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Friends")
        }
        .onAppear {
            friendsViewModel.load()
        }
    }
}

struct FriendItemView : View {
    
    private let friend: Friend
    
    init(friend: Friend) {
        self.friend = friend
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: friend.photo))
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(friend.firstName)
                    .font(.system(size:18, weight: .black))
                    .padding(.bottom, 2)
                Text(friend.lastName)
            }
        }
    }
    
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
