import SwiftUI

struct Items: View {

  var elements: [String]

  var body: some View {
    HStack(spacing: 0) {
      ForEach(elements, id: \.self) {
        Item(label: $0)
      }
    }
  }
}

struct Items_Previews: PreviewProvider {
  static var previews: some View {
    Items(elements: ["A", "B"])
  }
}
