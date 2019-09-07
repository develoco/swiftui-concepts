import SwiftUI
import UIKit

struct Home: View {

  @State private var uiScrollView: UIScrollView?

  var body: some View {
    VStack {
      Text("Header")
      ScrollView {
        VStack {
          Text("Scroll down 👇")
          Color.red.frame(width: 1, height: 1000)
          Button("Back to 🔝") {
            self.uiScrollView?.contentOffset = CGPoint(x: 0.0, y: -20.0)
          }
        }
        .frame(maxWidth: .infinity)
      }
      .underlyingUIView {
        print("Initial offset: \($0.contentOffset)")
        self.uiScrollView = $0
      }
      Text("Footer")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
