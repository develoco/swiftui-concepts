import SwiftUI

struct CounterMessage: View {

  let count: Int
  
  init(_ count: Int = 0) {
    self.count = count
  }

  var body: some View {
    Text("Counted \(count, specifier: "%d") times")
  }
}

struct CounterMessage_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        CounterMessage(3)
        CounterMessage(6)
        .environment(\.locale, Locale(identifier: "es"))
      }.previewLayout(.sizeThatFits)
    }
}
