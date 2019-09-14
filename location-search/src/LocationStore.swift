import Foundation
import Combine
import MapKit

class LocationStore: ObservableObject {
  
  static func searchLocation(query: String, promise: @escaping (Future<[MKMapItem], Never>.Promise)) -> () {

    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    // request.resultTypes = [.address, .pointOfInterest]
    // request.region = mapView.region
    let search = MKLocalSearch(request: request)
    search.start { response, error in
        guard let response = response else {
          print("\(String(describing: error))")
          return
        }
        promise(.success(response.mapItems))
    }
  }

  
  @Published var searchQuery = ""

  var results: AnyPublisher<[MKMapItem], Never> {
    $searchQuery
    .debounce(for: 0.5, scheduler: RunLoop.main)
    .removeDuplicates()
    .flatMap { query in
      Future { LocationStore.searchLocation(query: query, promise: $0) }
    }
    .receive(on: DispatchQueue.main)
    .catch { e in
      Optional.Publisher(nil)
    }
    .eraseToAnyPublisher()
  }
}
