import SwiftUI

struct Enemy: View {

  @State var alive = true

  var body: some View {
    Group {
      if alive {
        Image(systemName: "ant")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 15)
        .foregroundColor(.red)
      } else {
        Image(systemName: "burst")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20)
        .foregroundColor(.yellow)
      }
    }
    
  }
}

struct Enemy_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Enemy()

      Enemy(alive: false)
      .previewDisplayName("Dead enemy")
    }
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
