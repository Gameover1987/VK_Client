
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NewsfeedView: View {
    @ObservedObject var newsFeedViewModel = NewsfeedViewModel(vkApi: VkApi.shared,
                                                              viewModelFactory: NewsfeedViewModelFactory.shared)
    
    var body: some View {
        
        NavigationView {

            ScrollView {
                if (newsFeedViewModel.posts.count > 0) {
                    ForEach(newsFeedViewModel.posts) { post in
                        PostView(post)
                    }
                } else {
                    VStack {
                        Text("Здесь пока что нет новостей")
                    }
                }
            }
           
            .listStyle(.inset)
            .navigationTitle("Все обо всем и обо всех")
        }
        .onAppear {
            newsFeedViewModel.load()
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsfeedView()
    }
}
