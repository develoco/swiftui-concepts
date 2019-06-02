import SwiftUI

struct FirstScreen: View {

  var body: some View {
    VStack {
      Text("This is the first screen.")
      NavigationLink(
        "Go to second screen",
        destination:
          SecondScreen()
          .navigationBarTitle("Second Screen")
      )
    }
  }
}

struct FirstScreen_Previews: PreviewProvider {
  static var previews: some View {
    FirstScreen()
  }
}
