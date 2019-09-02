import SwiftUI

struct Projectile: View {

  var body: some View {
    Image(systemName: "staroflife")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 10)
    .foregroundColor(.green)
  }
}

struct Projectile_Previews: PreviewProvider {
  static var previews: some View {
    Projectile()
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
