import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack {
        NavigationLink("Wrapped UILabel",
          destination: LabelClient()
        )
        NavigationLink("Wrapped UIButton",
          destination: ButtonClient()
        )
        NavigationLink("Wrapped UIView (Box)",
          destination: ViewBoxClient()
        )
      }.navigationBarTitle("UIKit Integrations")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
