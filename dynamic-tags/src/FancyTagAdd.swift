import SwiftUI

struct FancyTagAdd: View {
  
  @State var tags = ["foo", "bar"]
  
  var body: some View {
    VStack {
      Text("Adding a tag (inline)")
      .font(.title)
      Text("""
      Add new will insert an editable tag at the end of the list.
      You can then type in the name for the new tag and confirm or cancel the addition of the tag.
      """)
      TagCloudInline(tags: $tags)
      Spacer()
    }
  }
}

struct FancyTagAdd_Previews: PreviewProvider {
  static var previews: some View {
    FancyTagAdd()
  }
}
