import SwiftUI

struct ButtonClient: View {
  @State var count = 0

  var body: some View {
    VStack {
      Spacer()
      LegacyButton(
        action: { self.count += 1 },
        title: "Count is \(count)").fixedSize()
      Spacer()
    }
  }
}

struct ButtonClient_Previews: PreviewProvider {
  static var previews: some View {
    ButtonClient()
  }
}
