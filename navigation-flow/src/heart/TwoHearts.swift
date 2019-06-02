import SwiftUI

struct TwoHearts: View {

  var goBack: () -> () = {}

  var body: some View {
    ScrollView(.vertical) {
      VStack {
        Text("""
        🖤
        🖤
        """)
        .padding()
        Button("Go back to the home of hearts", action: goBack)
        .padding()
      }
    }
    .frame(maxWidth: .infinity)
    .preference(key: HideTabs.self, value: true)
  }
}

struct TwoHearts_Previews: PreviewProvider {
  static var previews: some View {
    TwoHearts()
  }
}
