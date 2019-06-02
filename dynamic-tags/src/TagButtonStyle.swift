import SwiftUI

struct TagButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      CancelButton()
      Spacer()
        .frame(maxWidth: 20)
      configuration.label
        .fixedSize()
    }
    .padding(.vertical, 5)
    .padding(.horizontal)
    .foregroundColor(.white)
    .background(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.gray]), startPoint: .leading, endPoint: .trailing))
    .cornerRadius(40)
  }
}

struct TagButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Button("foo") { }
      .buttonStyle(TagButtonStyle())
  }
}
