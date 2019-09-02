import SwiftUI

struct StatefulView: View, Equatable {

  static func == (lhs: StatefulView, rhs: StatefulView) -> Bool {
    true
  }

  @State var isOn = false
  var body: some View {
  
  print("DOH!!")
  return
    Button("I'm \(isOn ? "ON" : "OFF")") {
      self.isOn.toggle()
    }
  }
}

struct StatefulView_Previews: PreviewProvider {
  static var previews: some View {
    StatefulView()
  }
}
