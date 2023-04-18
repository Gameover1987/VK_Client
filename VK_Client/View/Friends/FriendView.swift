
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendView: View {
    private let friend: FriendViewModel

    init(by friend: FriendViewModel) {
        self.friend = friend
    }
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: friend.photo))
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
            HStack {
                Text(friend.firstName)
                    .font(.system(size:20, weight: .black))
                Text(friend.lastName)
                    .font(.system(size:20, weight: .black))
            }
            HStack {
                Text(friend.locationInfo)
                    .font(.system(size:12, weight: .light))
            }
            HStack {
                Text(friend.status)
            }.padding(.top, 10)
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(by: FriendViewModel(
            friend: Friend(
                userId: 123,
                photo: "",
                bigPhoto: "",
                firstName: "Clint",
                lastName: "Eastwood",
                status: "Priv che del??",
                city: City(id: 0,
                           title: "Novosibirsk"),
                country: Country(id: 0,
                                 title: "Russia"))))
    }
}
