import SwiftUI

struct Home: View {

  var body: some View {
    VStack {
      Text("Taking localized key as parameter")
        .font(.title)
      CustomLabel("Wardrobe localization")
      Text("Interpolation example")
        .font(.title)
      CounterMessage(10)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
