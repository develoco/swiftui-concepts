import SwiftUI

struct Item: View, Identifiable {

  var label: String
  @State var isOn = false
  var id: some Hashable {
    label.hashValue
  }

  var body: some View {
    ZStack {
      Text("\(label)")
      .font(.title)
    }
    .foregroundColor(.white)
    .frame(width: 50, height: 50)
    .border(Color.accentColor, width: 1)
    .background(isOn ? Color.accentColor : Color.gray)
    .onTapGesture {
      self.isOn.toggle()
    }
    .id(label.hashValue)
  }
}

struct Item_Previews: PreviewProvider {
  static var previews: some View {
    Item(label: "A")
  }
}
