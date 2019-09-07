import SwiftUI
import WebKit

struct _HTMLContentInner: UIViewRepresentable {
  
    var content: String
    var onHeightSet: (CGFloat) -> () = {_ in }

    func makeUIView(context: Context) -> WKWebView  {
        let prefs = WKWebpagePreferences()
        prefs.preferredContentMode = .mobile
        let conf = WKWebViewConfiguration()
        conf.defaultWebpagePreferences = prefs
        let view = WKWebView(frame: WKWebView().frame, configuration: conf)
        view.isUserInteractionEnabled = false
        view.loadHTMLString(content, baseURL: Bundle.main.bundleURL)
        view.loadHTMLString("""
            <html><head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                @font-face {
                    font-family: DancingScript;
                    src: url(DancingScript-Regular.ttf);
                }
                :root {
                    font-size: 13px;
                    line-height: 18px;
                    letter-spacing: 0.2px;
                    font-family: DancingScript;
                }
                html, body {
                    margin: 0;
                    padding: 0;
                }
                a {
                    text-decoration: inherit;
                    color: inherit;
                    font-style: italic;
                }
            </style></head>
            <body>
                \(content)
            </body></html>
        """, baseURL: Bundle.main.bundleURL)
        view.navigationDelegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: _HTMLContentInner

        init(_ parent: _HTMLContentInner) {
            self.parent = parent
        }
    }
}

extension _HTMLContentInner.Coordinator: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.readyState", completionHandler: { (complete, error) in
            if complete != nil {
                webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
                    let containerHeight = height as! CGFloat
                    self.parent.onHeightSet(containerHeight)
                })
            }
        })
    }
}

struct _HTMLContentInner_Previews: PreviewProvider {
    static var previews: some View {
        _HTMLContentInner(content: "<h1>Hello, <em>World</em>!</h1>")
    }
}
