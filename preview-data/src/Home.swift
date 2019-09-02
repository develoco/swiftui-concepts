import SwiftUI

struct Home: View {

  var names = Names(personOne: "Real Person 1", personTwo: "Real Person 2")
  var body: some View {
    Text("Hello, \(names.personOne) and \(names.personTwo)!")
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home(names: .withPreviewData())
  }
}
