import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack {
        VStack {
          LoopCarousel(cards: ["foo", "bar", "baz"], current: 3, loop: true)
          LoopCarousel(cards: ["foo", "bar", "baz"], current: 3, horizontalAlignment: .leading, peekOffset: 32, loop: true)
          LoopCarousel(cards: ["foo", "bar", "baz"], current: 3, horizontalAlignment: .trailing, peekOffset: 32, loop: true)
        }.navigationBarTitle("Asymmetric Carousel")
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
