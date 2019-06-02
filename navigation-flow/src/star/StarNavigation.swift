import SwiftUI

struct StarNavigation: View {

  @State var currentPage = 0

  var body: some View {
    VStack {
      if (currentPage == 0) {
        StarHome(goToNext: {
          withAnimation {
            self.currentPage = 1
          }
        })
      } else if (currentPage == 1) {
        StarPageTwo(goBack: {
          withAnimation {
            self.currentPage = 0
          }
        })
      }
    }
  }
}

struct StarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    StarNavigation()
  }
}
