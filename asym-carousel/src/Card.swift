import SwiftUI
import Combine

struct Card: View {
  
  static var normalWidth: CGFloat = 80
  static var selectedWidth: CGFloat = 130
  static var normalHeight: CGFloat? = nil
  static var selectedHeight: CGFloat? = .infinity
  //static var height: CGFloat = 90
  
  @State var content: String
  @Binding var isSelected: Bool
  
  var width: CGFloat {
    isSelected ? Self.selectedWidth : Self.normalWidth
  }
  
  var maxHeight: CGFloat? {
    isSelected ? Self.selectedHeight : Self.normalHeight
  }
  
  var body: some View {
    VStack {
      Text("\(isSelected ? "o" : "x")")
      Text(content)
    }
    .padding()
    .frame(width: width)
    .frame(maxHeight: maxHeight)
    .background(Color.orange)
    //.opacity(0.35)
  }
}

struct Card_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Card(content: "Foo", isSelected: .constant(true))
        .frame(maxHeight: 200)
      Card(content: "Bar", isSelected: .constant(false))
    }.previewLayout(.sizeThatFits)
  }
}
