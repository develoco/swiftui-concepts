import SwiftUI

struct Toggles: View {
  @Binding var tags: [Tag]

  var body: some View {
    VStack {
      Text("Toggle control").font(.title)
      ScrollView(.horizontal) {
        HStack {
          ForEach(0..<tags.count) { i in
            Toggle(
              self.tags[i].label,
              isOn: self._tags[i].isOn
            ).fixedSize()
          }
        }
      }
    }
  }
}

struct Toggles_Previews: PreviewProvider {
  static var previews: some View {
    Toggles(tags: .constant([
      Tag(label: "foo"),
      Tag(label: "bar", isOn: true),
      Tag(label: "baz")
    ]))
  }
}
