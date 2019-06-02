import SwiftUI

struct OnOffDashboard: View {

  @State var currentStatus = false {
    willSet {
      print("willSet called with new value: \(newValue)")
    }
    didSet {
      print("didSet called")
    }
  }

  var indicatorColor: Color {
    currentStatus ? .green : .gray
  }
  
  var indicator: some View {
    Circle().foregroundColor(indicatorColor)
      .frame(width: 10, height: 10)
  }

  var body: some View {
    VStack {
      HStack {
        indicator
        Text("Current status is: \(currentStatus ? "ON" : "OFF")")
      }
      Button("Toggle status") {
        self.currentStatus.toggle()
      }
    }
  }
}

struct OnOffDashboard_Previews: PreviewProvider {
  static var previews: some View {
    OnOffDashboard()
  }
}
