import SwiftUI

struct TagDisplay: View {
  var title: LocalizedStringKey
  var labels: [String]
  var body: some View {
    Group {
      Text(title).font(.title)
      ScrollView(.horizontal) {
        HStack {
          ForEach(labels, id: \.hash) {
            Text("\($0), ")
            .fixedSize()
          }
        }
      }
    }
  }
}

struct TagDisplay_Previews: PreviewProvider {
  static var previews: some View {
    TagDisplay(
      title: "foo",
      labels: ["foo", "bar", "baz"]
    )
  }
}
