import SwiftUI

struct LabelClient: View {
  @State var count = 0

  var body: some View {
    VStack {
      Spacer()
      Button(action: { self.count += 1 }) {
        LegacyLabel(text: "Count is \(count)")
          .fixedSize()
        //Text("Count is \(count)")
      }
      Spacer()
    }
  }
}

struct LabelClient_Previews: PreviewProvider {
  static var previews: some View {
    LabelClient()
  }
}
