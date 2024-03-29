
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CollectionView : View {
    
    private let columns: [Column]
    
    private let columnsCount = 3
    private let spacing = 2.0
    private let cellHeight = 150.0
    
    private let loadMore: (() -> Void)?
    
    struct Column: Identifiable {
        let id = UUID()
        var items = [PhotoViewModel]()
    }
    
    init (items: [PhotoViewModel], loadMore: (() -> Void)? = nil) {
        
        self.loadMore = loadMore
        
        var columns = [Column]()
        for _ in 0 ..< columnsCount {
            columns.append(Column())
        }
        
        var columnHeights = Array<CGFloat>(repeating: 0, count: columnsCount)
        
        for item in items {
            var minColumnIndex = 0
            var minColumnHeight = columnHeights.first
            
            for i in 1 ..< columnHeights.count {
                let currentHeight = columnHeights[i]
                if currentHeight < minColumnHeight ?? 0 {
                    minColumnHeight = currentHeight
                    minColumnIndex = i
                }
            }
            
            columns[minColumnIndex].items.append(item)
            columnHeights[minColumnIndex] += item.imageHeight
        }
        
        self.columns = columns
    }
    
    var body: some View {
        HStack (alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack (spacing: spacing) {
                    ForEach (column.items, id: \.id) { photo in
                        NavigationLink {
                            GeometryReader { reader in
                                WebImage(url: URL(string: photo.largeUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: reader.size.width,
                                           height: reader.size.height,
                                           alignment: .center)
                            }
                        } label: {
                            PhotoCell(photo: photo)
                        }
                    }
                    
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.clear)
                        .onAppear {
                            if column.items.count > 0 {
                                loadMore?()
                            }
                        }
                }
            }
        }
    }
}
