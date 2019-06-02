import SwiftUI

struct TabTwoFirst: View {

  var body: some View {
    VStack {
      Text("This is the first screen ") +
        Text("of tab number two.").bold()
    }
  }
}

struct TabTwoFirst_Previews: PreviewProvider {
  static var previews: some View {
    TabTwoFirst()
  }
}
