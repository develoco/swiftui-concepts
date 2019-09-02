import SwiftUI

struct Arrow: View {

  var direction = "up"

  var body: some View {
    VStack {
      Image(systemName: "arrow.\(direction).square.fill")
      .resizable()
      .frame(width: 50, height: 50)
      .foregroundColor(.accentColor)
    }
  }
}

struct Arrow_Previews: PreviewProvider {
  static var previews: some View {
    Arrow()
  }
}
