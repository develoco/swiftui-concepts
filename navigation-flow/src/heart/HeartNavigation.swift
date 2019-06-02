import SwiftUI

struct HeartNavigation: View {

  @State var currentPage = 0

  var body: some View {
    ZStack {
      HeartHome(goToNext: {
        withAnimation {
          self.currentPage = 1
        }
      })
      .opacity(currentPage == 0 ? 1 : 0)
      if currentPage > 0 {
        TwoHearts(goBack: {
          withAnimation {
            self.currentPage = 0
          }
        })
      }
    }
  }
}

struct HeartNavigation_Previews: PreviewProvider {
  static var previews: some View {
    HeartNavigation()
  }
}
