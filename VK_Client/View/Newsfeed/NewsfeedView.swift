
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NewsfeedView: View {
    @ObservedObject var newsFeedViewModel = NewsfeedViewModel(vkApi: VkApi.shared,
                                                              viewModelFactory: NewsfeedViewModelFactory.shared)
    
    var body: some View {
        
        NavigationView {

            ScrollView {
                ForEach(newsFeedViewModel.posts) { post in
                    PostView(post)
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
