import SwiftUI

struct TagCloudInline: View {

  @Binding var tags: [String]
  @State var adding = false
  @State var newTag = ""
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(tags, id: \.hash) { tag in
          Button(tag) {
            self.tags.remove(at: self.tags.firstIndex(of: tag)!)
          }
        }
        .buttonStyle(TagButtonStyle())
        if (adding) {
          HStack(spacing: 5) {
            TextField("Your tag", text: $newTag) {
              self.tags.append(self.newTag)
              self.adding.toggle()
              self.newTag = ""
            }
            .fixedSize()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .lineLimit(1)
            .keyboardType(.alphabet)
            CancelButton()
            .onTapGesture {
              self.adding.toggle()
              self.newTag = ""
            }
          }
          .padding(.horizontal, 5)
        } else {
          Button("Add new") {
            self.adding.toggle()
          }
        }
      }
    }
    .padding()
  }
}

struct TagCloudInline_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TagCloudInline(tags: .constant(["foo", "bar"]))
      TagCloudInline(tags: .constant(["foo", "bar"]), adding: true)
        .previewDisplayName("Adding a tag")
    }.previewLayout(.sizeThatFits)
  }
}
