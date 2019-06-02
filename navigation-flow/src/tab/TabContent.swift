import SwiftUI

struct TabContent: View {

  var tab: String

  var body: some View {
    Group {
      if tab == "star" {
        StarNavigation()
      } else {
        HeartNavigation()
      }
    }
  }
}

struct TabContent_Previews: PreviewProvider {
  static var previews: some View {
    TabContent(tab: "star")
  }
}
