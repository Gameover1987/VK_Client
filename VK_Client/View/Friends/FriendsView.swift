
import SwiftUI

struct FriendsView: View {
    @ObservedObject var friendsViewModel = FriendsViewModel(vkApi: VkApi.shared,
                                                            factory: ViewModelFactory.shared)
    
    var body: some View {
        
        NavigationView {
            if (friendsViewModel.friends.count == 0) {
                VStack {
                    Text("У вас пока что нет друзей")
                }
                .navigationTitle("Друзья")
            }
            else {
                List(friendsViewModel.friends) { friend in
                    NavigationLink {
                        FriendView(by: friend)
                    } label: {
                        FriendItemView(by: friend)
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Друзья")
            }
        }
        .onAppear {
            friendsViewModel.load()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
