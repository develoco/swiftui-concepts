import SwiftUI

struct HTMLContent: View {

  var content: String
  @State private var webViewHeight: CGFloat = 0

  var body: some View {
    _HTMLContentInner(content: content) {
        self.webViewHeight = $0
    }
    .frame(height: self.webViewHeight)
  }
}

struct HTMLContent_Previews: PreviewProvider {
  static var previews: some View {
    HTMLContent(content: "<h1>Hello <strong>World</strong></h1>")
  }
}
