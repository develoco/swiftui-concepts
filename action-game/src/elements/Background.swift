import SwiftUI

struct Background: View {

  var body: some View {
    ZStack {
      Color.black
      Star()
      .offset(x: -100, y: -200)
      Star()
      .offset(x: 150, y: -100)
      Star(color: .blue)
      .offset(x: 100, y: 150)
      Star(color: .yellow)
      .offset(x: 100, y: 100)
    }
  }
}

struct Background_Previews: PreviewProvider {
  static var previews: some View {
    Background()
  }
}
