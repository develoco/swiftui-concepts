import SwiftUI

struct Tags: View {
  @Binding var tags: [Tag]

  var body: some View {
    VStack {
      Text("Dual control").font(.title)
      Text("Selected")
      ScrollView(.horizontal) {
        HStack {
          ForEach(tags.filter { $0.isOn }) { tag in
            Button(tag.label) {
              self._tags[
                self.tags.firstIndex { $0.id == tag.id }!
              ].isOn.wrappedValue.toggle()
            }.fixedSize()
          }
        }
      }

      Text("Unselected")
      ScrollView(.horizontal) {
        HStack {
          ForEach(tags.filter { !$0.isOn }) { tag in
            Button(tag.label) {
              // tag.isOn.toggle()
              self._tags[
                self.tags.firstIndex { $0.id == tag.id }!
              ].isOn.wrappedValue.toggle()
            }.fixedSize()
          }
        }
      }
    }
  }
}

struct Tags_Previews: PreviewProvider {
  static var previews: some View {
    Tags(tags: .constant([
      Tag(label: "foo"),
      Tag(label: "bar", isOn: true),
      Tag(label: "baz")
    ]))
  }
}
