import SwiftUI

struct SpaceShip: View {

  var body: some View {
    Image(systemName: "paperplane.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30)
        .foregroundColor(.green)
  }
}

struct SpaceShip_Previews: PreviewProvider {
  static var previews: some View {
    SpaceShip()
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
