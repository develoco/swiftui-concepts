import SwiftUI

struct CustomLabel: View {

  let text: LocalizedStringKey
  
  init(_ text: LocalizedStringKey, count: Int = 0) {
    self.text = text
  }

  var body: some View {
    Text(text)
      .background(Color.yellow)
  }
}

struct CustomLabel_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        CustomLabel("Wardrobe localization")
        CustomLabel("Wardrobe localization")
        .environment(\.locale, Locale(identifier: "es"))
      }.previewLayout(.sizeThatFits)
    }
}
