import SwiftUI

struct SecondScreen: View {

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    VStack {
      Text("This is the second screen.")
      Button("Back to first screen") {
        self.presentationMode.wrappedValue.dismiss()
      }
    }
  }
}

struct SecondScreen_Previews: PreviewProvider {
  static var previews: some View {
    SecondScreen()
  }
}
