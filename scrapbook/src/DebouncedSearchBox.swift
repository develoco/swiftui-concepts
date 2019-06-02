import SwiftUI
import Combine

class SearchModel: ObservableObject {
  @Published var searchBox = ""
}

struct DebouncedSearchBox: View {

  var debouncedSearchBox: AnyPublisher<String, Never> {
    searchModel.$searchBox
      .debounce(for: 1, scheduler: DispatchQueue.global(qos: .userInitiated))
      //.subscribe(on: DispatchQueue.global(qos: .userInitiated)) // does not fix debounce
      .receive(on: RunLoop.main) // useful only when using delay/debounce
      .removeDuplicates()
      .drop { $0.count < 3 }
      .eraseToAnyPublisher()
  }

  @ObservedObject var searchModel = SearchModel()
  @State var query = ""

  @State var allItems = [
    "foo",
    "bar",
    "baz",
    "foobar",
    "foobaz",
    "foobarbaz"
  ]
  
  var filteredItems: [String] {
    allItems.filter {
      query == "" || $0.contains(query.lowercased())
    }
  }

  var body: some View {
    VStack {
      TextField("Search for…", text: $searchModel.searchBox)
        .padding()
      List {
        ForEach(filteredItems, id: \.self) {
          Text($0)
        }
      }
    }
    .onReceive(debouncedSearchBox) {
      print("Receiving query \($0)")
      self.query = $0
    }
    .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct DebouncedSearchBox_Previews: PreviewProvider {
  static var previews: some View {
    DebouncedSearchBox()
  }
}
