import SwiftUI

struct Tab: View {

  var name: String
  @Binding var currentTab: String

  var body: some View {
    Image(systemName: name)
    .foregroundColor(currentTab == name ? .accentColor : .black)
    .onTapGesture {
      withAnimation {
        self.currentTab = self.name
      }
    }
  }
}

struct Tab_Previews: PreviewProvider {
  static var previews: some View {
    Tab(name: "star", currentTab: .constant("star"))
  }
}
