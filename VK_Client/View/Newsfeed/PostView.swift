
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PostView : View {
    
    private let post: PostViewModel
    
    init(_ postViewModel: PostViewModel) {
        self.post = postViewModel
    }
    
    var body: some View {
        VStack {
            // Шапка
            HStack {
                WebImage(url: URL(string: post.url))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack (alignment: .leading) {
                    Text(post.title)
                        .font(.system(size:17, weight: .medium))
                    HStack {
                        Text(post.date.toString(format: "dd.MM.yyyy HH:mm"))
                            .font(.system(size:13, weight: .light))
                    }
                   
                }.padding(.leading, 10)
                
                Spacer()
            }
            
            // Text
            Text(post.text)
                .lineLimit(1...10)
            
            
            // Likes and views
            HStack {
                
            }
        }
        .padding(.leading, 6)
        .padding(.bottom, 6)
    }
    
}
