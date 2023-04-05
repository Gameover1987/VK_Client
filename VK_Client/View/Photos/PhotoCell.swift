
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

import Foundation

struct PhotoCell : View {
    var photo: PhotoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                GeometryReader { reader in
                    WebImage(url: URL(string: photo.previewUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width,
                               height: reader.size.height,
                               alignment: .center)
                }
                
                if photo.hasText {
                    Text(photo.text)
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding(4)
                        .shadow(color: .black.opacity(0.2), radius: 1)
                }
            }
            .frame(height: photo.imageHeight)
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(2)
    }
}
