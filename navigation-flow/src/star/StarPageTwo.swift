import SwiftUI

struct StarPageTwo: View {

  var goBack: () -> () = {}

  var body: some View {
    VStack {
      Button("Back home", action: goBack)
      .padding()
      ScrollView(.vertical) {
        VStack {
          Text("This is page two")
          .font(.largeTitle)
          .padding()
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}

struct StarPageTwo_Previews: PreviewProvider {
  static var previews: some View {
    StarPageTwo()
  }
}
