import SwiftUI

struct DebouncedSearchBox: View {

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
      TextField("Search for…", text: $query)
        .padding()
      List {
        ForEach(filteredItems, id: \.self) {
          Text($0)
        }
      }
    }
    .onReceive(
      query
        .publisher
        //.delay(for: .seconds(1), scheduler: DispatchQueue.global(qos: .userInitiated)) // works
        //.debounce(for: .seconds(1), scheduler: DispatchQueue.global(qos: .userInitiated)) // does not work
        //.subscribe(on: DispatchQueue.global(qos: .userInitiated)) // does not fix debounce
        .receive(on: RunLoop.main) // useful only when using delay/debounce
        .reduce("") { "\($0)\($1)" }
    ) {
      print("Searching for \"\($0)\" \"\(self.query)\" ")
    }
    .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct DebouncedSearchBox_Previews: PreviewProvider {
  static var previews: some View {
    DebouncedSearchBox()
  }
}
