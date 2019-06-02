import SwiftUI

struct TabView: View {

  @State var currentTab = "star"
  @State private var hideTabs = false

  var body: some View {
    VStack {
      TabContent(tab: currentTab)
      if !hideTabs {
        TabBar(currentTab: $currentTab)
          .transition(.scale)
      }
    }
    .onPreferenceChange(HideTabs.self) { hideTabs in
      withAnimation {
        self.hideTabs = hideTabs
      }
    }
  }
}

struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    TabView()
  }
}
