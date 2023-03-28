
import SwiftUI

struct MessengerView: View {
    var body: some View {
        ScrollView {
            
        }.tabItem {
            Image(systemName: "message")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MessengerView()
    }
}
