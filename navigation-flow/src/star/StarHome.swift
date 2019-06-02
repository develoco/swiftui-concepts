import SwiftUI

struct StarHome: View {

  var goToNext: () -> () = {}
 
  var body: some View {
    ScrollView(.vertical) {
      VStack {
        Text("Star Home")
        .font(.largeTitle)
        .padding()
        Button("On to page 2", action: goToNext)
        .padding()
      }
    }
    .frame(maxWidth: .infinity)
  }
}

struct StarHome_Previews: PreviewProvider {
  static var previews: some View {
    StarHome()
  }
}
