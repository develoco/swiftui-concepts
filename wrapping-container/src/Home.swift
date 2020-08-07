import SwiftUI

struct Container: View {
  
  var content: [AnyView]

  init<A: View, B: View>(@ViewBuilder content: () -> TupleView<(A, B)>) {
    let (a, b) = content().value
    if let group = b as? SwiftUI.Group<SwiftUI.TupleView<(SwiftUI.Text, SwiftUI.Text)>> {
      group
    }
    self.content = [
      AnyView(a),
      AnyView(b)
    ]
  }

  var body: some View {
    VStack {
      Text("hello")
      ForEach(content.indices) {
        self.content[$0]
      }
    }
  }
}

let rootView = Container {
  ForEach(0..<3) {
    Text("Hi \($0)")
  }
  Group {
    Text("Hi")
    Text("GB")
  }
}


struct Home: View {

  var body: some View {
    rootView
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
