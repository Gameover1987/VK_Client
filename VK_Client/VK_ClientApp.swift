
import SwiftUI

@main
struct VK_ClientApp: App {

    var body: some Scene {
        WindowGroup {
            LoginView().ignoresSafeArea(.all)
        }
    }
}
