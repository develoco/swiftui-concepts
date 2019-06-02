import SwiftUI

struct SimpleTagAdd: View {
  
  @State var tags = ["foo", "bar"]
  
  var body: some View {
    VStack {
      Text("Adding a tag")
      .font(.title)
      Text("""
      Add new will present a modal alert with a textbox.
      Tapping on existing tags will remove them from the list.
      """)
      TagCloudPopUp(tags: $tags)
    }
  }
}

struct SimpleTagAdd_Previews: PreviewProvider {
  static var previews: some View {
    SimpleTagAdd()
  }
}
