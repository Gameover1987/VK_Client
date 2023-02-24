import SwiftUI
import WebKit

struct WebPageView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    @Binding var authorizationInfo: AuthorizationInfo?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        webView.navigationDelegate = context.coordinator
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [
            URLQueryItem(name: "client_id", value: "51559125"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token")
        ]
        
        guard let url = urlComponent.url else {
            print("Authorization URL is nil")
            return webView
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator { authorizationInfo in
            self.authorizationInfo = authorizationInfo
        }
    }
}

final class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    var authorizationInfo: (AuthorizationInfo) -> Void
    
    init(authorizationInfo: @escaping (AuthorizationInfo) -> Void) {
        self.authorizationInfo = authorizationInfo
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce ([String: String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        guard let accessToken = params["access_token"],
              let userId = Int(params["user_id"] ?? ""),
              let expiresIn = Int(params["expires_in"] ?? "") else {
            decisionHandler(.cancel)
            return
        }
        
        let authorizationInfo = AuthorizationInfo(token: accessToken, userId: userId, expiresIn: expiresIn)
        self.authorizationInfo(authorizationInfo)
        
        decisionHandler(.cancel)
    }
}

