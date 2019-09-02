import SwiftUI

struct Items: View {

  var elements: [Item]

  var body: some View {
    HStack(spacing: 0) {
      ForEach(elements) {
        $0
      }
    }
  }
}

struct Items_Previews: PreviewProvider {
  static var previews: some View {
    Items(elements: [])
  }
}
