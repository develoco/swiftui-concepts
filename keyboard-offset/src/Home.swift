import SwiftUI

struct Home: View {

  @State var textFieldValue = ""

  var body: some View {
    Text("Hello")
      .sheet(isPresented: .constant(true)) {
    VStack {
      Text("The text field at the bottom would typically be covered by the software keyboard coming up.")
      Spacer()
      HeightDisplay()
      VStack {
        Text("Regular text field:")
        TextField("Enter some text", text: self.$textFieldValue)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .padding()
    }
    .keyboardAware()
  }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
