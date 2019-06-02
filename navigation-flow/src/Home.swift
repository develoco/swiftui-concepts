import SwiftUI

struct Home: View {

  var body: some View {
    TabView {
      TabOne()
      .tabItem {
        VStack {
          Image(systemName: "1.square.fill")
          Text("First")
        }
      }
      TabTwo()
      .tabItem {
        VStack {
          Image(systemName: "3.square.fill")
          Text("Second")
        }
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
