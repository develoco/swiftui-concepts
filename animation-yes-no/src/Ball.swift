import SwiftUI

struct Ball: View {
  
  var maxOffset: CGFloat = 50
  @State var offset: CGFloat = 0
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.purple
      Image(systemName: "largecircle.fill.circle")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 100)
      .foregroundColor(.orange)
      .background(Color.yellow)
      .clipShape(Circle())
      .offset(y: -offset)
      .onTapGesture {
//        if self.offset == self.maxOffset {
//          self.offset = 0
//        }
        withAnimation(.easeIn(duration: 1)) {
          self.offset = self.maxOffset
        }
        withAnimation(Animation.easeOut(duration: 1).delay(1) as Animation) {
          self.offset = 0
        }
      }
    }
  }
}

struct Ball_Previews: PreviewProvider {
  static var previews: some View {
    Ball()
  }
}
