import SwiftUI

struct Home: View {
  
  var maxOffset: CGFloat = 50
  @State var offset: CGFloat = 0
  
  var body: some View {
    Text("Hello, World!")
    .padding()
    .background(Color.accentColor)
    .offset(x: offset)
    .onTapGesture {
      if self.offset == self.maxOffset {
        self.offset = 0
      }
      withAnimation {
        self.offset = self.maxOffset
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
