import SwiftUI

struct CancelButton: View {
  var body: some View {
    Image(systemName: "xmark")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 11)
  }
}

struct CancelButton_Previews: PreviewProvider {
  static var previews: some View {
    CancelButton().previewLayout(.sizeThatFits)
  }
}
