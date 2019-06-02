import SwiftUI

struct TintedUmbrella: View {
  
  @State private var indicatorColor = Color.black
  
  func makeBody(color: Color! = .black) -> some View {
    VStack {
      
      Image(systemName: "umbrella")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 35)
        .foregroundColor(color)
        .background(
          AngularGradient(gradient: Gradient(colors: [color, .white, color, .white]), center: .center)
            .opacity(0.5)
            .frame(width: 50, height: 50)
      )
      Text("Tinted Umberella").bold().font(.title).padding()
    }
  }
  
  var body: some View {
    makeBody()
  }
  
  func foregroundColor(_ color: Color?) -> some View
  {
    makeBody(color: color)
  }
}

struct TintedUmbrella_Previews: PreviewProvider {
  static var previews: some View {
    TintedUmbrella()
      .foregroundColor(.red)
  }
}
