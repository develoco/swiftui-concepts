import SwiftUI

struct TabOne: View {

  var body: some View {
    NavigationView {
      FirstScreen()
      .navigationBarTitle("First Screen")
    }
  }
}

struct TabOne_Previews: PreviewProvider {
  static var previews: some View {
    TabOne()
  }
}
