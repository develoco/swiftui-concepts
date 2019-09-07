import SwiftUI

struct Home: View {

  var body: some View {
    HTMLContent(content: "<h1>Hello <strong>World</strong></h1>")
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
    .previewDisplayName("Go to live view to see preview")
  }
}
