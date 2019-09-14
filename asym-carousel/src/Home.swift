import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack {
        VStack {
          LoopCarousel(cards: ["foo", "bar", "baz"], initialSelection: 4, loop: true)
          LoopCarousel(cards: ["foo", "bar", "baz"], horizontalAlignment: .leading, peekOffset: 32, loop: true)
          LoopCarousel(cards: ["foo", "bar", "baz"], initialSelection: 2, horizontalAlignment: .trailing, peekOffset: 32, loop: true)
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
