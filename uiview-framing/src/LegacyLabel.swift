import SwiftUI

struct LegacyLabel: UIViewRepresentable {

  var text: String

  func makeUIView(context: Context) -> UILabel {
    UILabel()
  }

  func updateUIView(_ label: UILabel, context: Context) {
    label.text = text
  }
}

struct LegacyLabel_Previews: PreviewProvider {
  static var previews: some View {
  
    LegacyLabel(text: "foo")
      .fixedSize()
      .previewLayout(.sizeThatFits)
  }
}
