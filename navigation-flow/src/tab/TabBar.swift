import SwiftUI

struct TabBar: View {

  @Binding var currentTab: String

  var body: some View {
    HStack {
      Spacer()
      Tab(name: "star", currentTab: _currentTab)
      Spacer()
      Tab(name: "heart", currentTab: _currentTab)
      Spacer()
    }.padding()
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar(currentTab: .constant("star"))
  }
}
