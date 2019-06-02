import SwiftUI

struct Home: View {

  @State var textFieldValue = ""

  var body: some View {
    VStack {
      Text("The text field at the bottom would typically be covered by the software keyboard coming up.")
      Spacer()
      HeightDisplay()
      VStack {
        Text("Regular text field:")
        TextField("Enter some text", text: $textFieldValue)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      .padding()
    }
    .keyboardAware()
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
