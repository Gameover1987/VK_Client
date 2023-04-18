import SwiftUI
import UIKit

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

// Main View
struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    let message: String
    var content: () -> Content

    var body: some View {
        VStack(alignment: .center) {
            Text(self.message)
                .bold()
            ActivityIndicatorView(isAnimating: .constant(true), style: .large)
        }
        .opacity(self.isShowing ? 1 : 0)
    }
}
