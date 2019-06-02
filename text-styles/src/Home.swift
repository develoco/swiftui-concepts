import SwiftUI

struct Home: View {

  var body: some View {
    VStack {
      Text("Environment font")
      Text("Body (Built-in)")
        .font(.body)
      Text("Body (Custom)")
        .customFont(.body)
      Text("Title (Built-in)")
        .font(.title)
      Text("Title (Custom)")
        .customFont(.title)
      Text("Subtitle (Custom)")
        .customFont(.subtitle)
      Group {
        Text("Paragraph style")
          .paragraphStyle(.body)
      }.customFont(.body)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Home()
        .previewDisplayName("Size category: (none)")
      Home()
        .environment(\.sizeCategory, .extraLarge)
        .previewDisplayName("Size category: Extra large")
    }.previewLayout(.sizeThatFits)
  }
}
