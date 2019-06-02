import SwiftUI

struct Home: View {

  var body: some View {
    VStack {
      Text("The following label would interpret the foreground color its own way.")

      TintedUmbrella()
      .foregroundColor(.red)
      .padding()

      Text("The text does not take the foreground color but the image and image background do.")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
