
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FriendItemView : View {

    private let friend: FriendViewModel

    init(by friend: FriendViewModel) {
        self.friend = friend
    }

    var body: some View {
        HStack {
            WebImage(url: URL(string: friend.photo))
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(friend.firstName)
                    .font(.system(size:18, weight: .regular))
                    .padding(.bottom, 2)
                Text(friend.lastName)
            }
        }
    }

}
