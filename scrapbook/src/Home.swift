import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        NavigationLink("Subject test ", destination: SubjectTest()
          .navigationBarTitle("Subject test")
        )
        NavigationLink("On/off dashboard", destination: OnOffDashboard()
          .navigationBarTitle("On/Off")
        )
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
