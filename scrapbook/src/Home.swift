import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        NavigationLink("On/off dashboard", destination: OnOffDashboard())
        NavigationLink("Debounced search box",
          destination:
            DebouncedSearchBox()
            .navigationBarTitle("Search")
        )
        Spacer()
      }
      .navigationBarTitle("Sample Code")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
