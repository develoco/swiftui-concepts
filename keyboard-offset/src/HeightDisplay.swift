import SwiftUI

struct HeightDisplay: View {

  @Environment(\.keyboardHeight) var keyboardHeight

  var body: some View {
    VStack {
      Text("Current keyboard height:")
      Text("\(keyboardHeight)").font(.title)
    }
  }
}

struct HeightDisplay_Previews: PreviewProvider {
  static var previews: some View {
    HeightDisplay()
  }
}
