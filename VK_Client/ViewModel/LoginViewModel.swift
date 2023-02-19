
import Foundation
import SwiftUI

final class LoginViewModel : ObservableObject {
    
    @Published var isLogin = false
    
    @Published var token = "" {
        didSet {
            isLogin = true
        }
    }
}
