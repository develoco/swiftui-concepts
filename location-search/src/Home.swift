import SwiftUI
import MapKit

struct Home: View {

  @State var search = ""
  @State var results: [MKMapItem] = []

  @ObservedObject private var locationStore = LocationStore()
  
  var body: some View {
    VStack {
      TextField("Search locations", text: $locationStore.searchQuery)
      List {
        ForEach(results, id: \.self) { mapItem in
          Text("\(mapItem.name ?? "Undefined location") \(mapItem.placemark.locality ?? "?") \(mapItem.placemark.countryCode ?? "Unknown Country")")
        }
      }
    }
    .onReceive(locationStore.results) {
      self.results = $0
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
