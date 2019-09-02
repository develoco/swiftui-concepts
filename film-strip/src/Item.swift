import SwiftUI

struct Item: View {

  var label: String

  var body: some View {
    ZStack {
      Text("\(label)")
      .font(.title)
    }
    
    .foregroundColor(.white)
    .frame(width: 50, height: 50)
    .border(Color.accentColor, width: 1)
    .background(Color.gray)
  }
}

struct Item_Previews: PreviewProvider {
  static var previews: some View {
    Item(label: "A")
  }
}
