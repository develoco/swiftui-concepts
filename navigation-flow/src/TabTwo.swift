import SwiftUI

struct TabTwo: View {

  var body: some View {
    NavigationView {
      TabTwoFirst()
      .navigationBarTitle("Root of Tab #2")
    }
  }
}

struct TabTwo_Previews: PreviewProvider {
  static var previews: some View {
    TabTwo()
  }
}
