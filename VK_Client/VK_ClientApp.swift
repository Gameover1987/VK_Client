
import SwiftUI

@main
struct VK_ClientApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView().ignoresSafeArea(.all)
        }
    }
}
