import SwiftUI

struct Home: View {

  static let content = Binding.constant(StatefulView().equatable())

  @State var includeView = false

  var body: some View {
    VStack {
      Button("\(includeView ? "Remove" : "Add") view to hierarchy") {
      self.includeView.toggle()
      }
      Self.content.wrappedValue.id(1)
      .opacity(includeView ? 1 : 0)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
