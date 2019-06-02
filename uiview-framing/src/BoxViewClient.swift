import SwiftUI

struct ViewBoxClient: View {

  @State var big = false

  var body: some View {
    VStack {
      Spacer()
      LegacyBoxView(big: $big)
      .fixedSize()
      .onTapGesture {
        withAnimation {
          self.big.toggle()
        }
      }
      Spacer()
    }
  }
}

struct ViewBoxClient_Previews: PreviewProvider {
  static var previews: some View {
    ViewBoxClient()
  }
}
