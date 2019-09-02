import SwiftUI

struct Star: View {

  @State var color = Color.white

  var body: some View {
      Image(systemName: "star")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 10)
      .foregroundColor(color)
  }
}

struct Star_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Star()
      Star(color: .blue)
    }
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
