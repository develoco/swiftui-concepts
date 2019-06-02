import SwiftUI

struct OnBoarding2: View {
  @Binding var show: Bool
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.white]), startPoint: .bottomLeading, endPoint: .topTrailing)
      
      VStack {
        Text("So are you ready?")
        Button("I'm in!") {
          self.show.toggle()
        }
      }
    }.navigationBarTitle("Last step")
  }
}

struct OnBoarding2_Previews: PreviewProvider {
  static var previews: some View {
    OnBoarding2(show: .constant(true))
  }
}
