import SwiftUI

struct TagCloudPopUp: View {

  @Binding var tags: [String]
  @State var showAlert = false
  @State var newTagName = ""

  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(tags, id: \.hash) { tag in
            Button(tag) {
              self.tags.remove(at: self.tags.firstIndex(of: tag)!)
            }
          }
        }
        .buttonStyle(TagButtonStyle())
      }
      HStack {
        Spacer()
        Button("Add new") {
          self.showAlert.toggle()
        }
      }
    }
    .padding()
    .sheet(isPresented: $showAlert) {
      VStack {
        Text("New Tag").font(.title)
        TextField("Type in the name of your new tag", text: self.$newTagName)
        HStack {
          Button(action: {
            self.tags.append(self.newTagName)
            self.showAlert.toggle()
            self.newTagName = ""
          }) {
            Text("Add").bold()
          }
          Button("Cancel") {
            self.showAlert.toggle()
            self.newTagName = ""
          }
        }
      }.padding()
    }
  }
}

struct TagCloudPopUp_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TagCloudPopUp(tags: .constant(["foo", "bar"]))
      TagCloudPopUp(tags: .constant(["foo", "bar"]), showAlert: true)
    }
  }
}
