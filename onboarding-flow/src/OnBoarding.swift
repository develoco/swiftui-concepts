import SwiftUI

struct OnBoarding: View {
  @Binding var show: Bool
  
  var body: some View {
    
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
        VStack {
          Text("""
          Testing flow in a sheet.

          Please continue on…

          """)
          NavigationLink("…this way", destination:
            OnBoarding2(show: _show)
          )
        }
      }.navigationBarTitle("Get on board!")
    }
  }
}

struct OnBoarding_Previews: PreviewProvider {
  static var previews: some View {
    OnBoarding(show: .constant(true))
  }
}
