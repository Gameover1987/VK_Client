
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CollectionView : View {
    
    private let columns: [Column]
    
    private let columnsCount = 3
    private let spacing = 10.0
    private let cellHeight = 150.0
    
    struct Column: Identifiable {
        let id = UUID()
        var items = [PhotoViewModel]()
    }
    
    init (items: [PhotoViewModel]) {
        
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
                            
                        } label: {
                            PhotoCell(photo: photo)
                        }
                    }
                }
            }
        }
    }
}
