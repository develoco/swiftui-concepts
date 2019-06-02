import SwiftUI

extension Text {
  
  public func paragraphStyle(_ textStyle: Font.TextStyle = .body) -> some View {
    switch textStyle {
    case .caption:
      return self.kerning(0.2)
    case .footnote:
      return self.kerning(0.2)
    case .subheadline:
      return self.kerning(0.2)
    case .callout:
      return self.kerning(0.8)
    case .body:
      return self.kerning(0.2)
    case .headline:
      return self.kerning(0.2)
    case .title:
      return self.kerning(0.2)
    case .largeTitle:
      return self.kerning(0.2)
    @unknown default:
      return self.kerning(0.2)
    }
  }

  public func paragraphStyle(_ textStyle: TextStyle = .subtitle) -> some View {
    switch textStyle {
    case .subtitle:
      return self.kerning(0.2)
    }
  }

  public func textStyle(_ textStyle: Font.TextStyle = .body) -> some View {
    return self.paragraphStyle(textStyle).customFont(textStyle)
  }

  public func textStyle(_ textStyle: TextStyle = .subtitle) -> some View {
    return self.paragraphStyle(textStyle).customFont(textStyle)
  }
}
