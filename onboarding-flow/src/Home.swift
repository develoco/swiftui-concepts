import SwiftUI

struct Home: View {
  @State var onboarding = true
  @State var alert = false
  var body: some View {
    VStack(spacing: 100) {
      Button("Login") {
        self.alert.toggle()
      }
      Button("Register") {
        self.alert.toggle()
      }
      Button("Re-start onboarding") {
        self.onboarding.toggle()
      }
    }
    .alert(isPresented: $alert) {
      Alert(
        title: Text("Not implemented"),
        message: Text("This feature has not yet been implemented."),
        dismissButton: .default(Text("Got it!")) {
          self.alert.toggle()
        }
      )
    }
    .sheet(isPresented: $onboarding) {
      OnBoarding(show: self.$onboarding)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
