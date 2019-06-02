import SwiftUI

struct Home: View {

  @State var username = ""
  @State var password = ""
  @State var passwordAgain = ""

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        Text("Please fill up your information to sign up for the service.")
          .padding()
        Form {
          Section {
            TextField("Username", text: $username)
          }
          Section {
            TextField("Password", text: $password)
            TextField("Password again", text: $passwordAgain)
          }
          Section {
            Button("Sign up") {
              
            }
          }
          .frame(maxWidth: .infinity, alignment: .center)
        }
        Spacer()
      }
      .navigationBarTitle("Welcome!")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
