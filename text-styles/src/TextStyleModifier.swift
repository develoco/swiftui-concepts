import SwiftUI

@usableFromInline struct TextStyleModifier: ViewModifier {

  @Environment(\.sizeCategory) var sizeCategory

  var fontTextStyle: Font.TextStyle?
  var textStyle: TextStyle?

  @usableFromInline init(_ textStyle: Font.TextStyle) {
    self.fontTextStyle = textStyle
  }

  @usableFromInline init(_ textStyle: TextStyle) {
    self.textStyle = textStyle
  }

  @usableFromInline func body(content: Content) -> some View {
    content.font(getFont())
  }

  func getScaleFactor() -> CGFloat {
    switch(sizeCategory) {
    case .extraSmall:
      return 0.5
    case .small:
      return 0.8
    case .medium:
      return 1
    case .large:
      return 1.1
    case .extraLarge:
      return 1.3
    case .extraExtraLarge:
      return 1.5
    case .extraExtraExtraLarge:
      return 2
    case .accessibilityMedium:
      return 1.1
    case .accessibilityLarge:
      return 1.3
    case .accessibilityExtraLarge:
      return 1.7
    case .accessibilityExtraExtraLarge:
      return 2
    case .accessibilityExtraExtraExtraLarge:
      return 3
    @unknown default:
      return 1
    }
  }
  
  func getFont() -> Font {
    switch fontTextStyle {
    case .caption:
      return Font.custom("OpenSans-Regular", size: 13 * getScaleFactor())
    case .footnote:
      return Font.custom("OpenSans-Regular", size: 13 * getScaleFactor())
    case .subheadline:
      return Font.custom("OpenSans-Regular", size: 13 * getScaleFactor())
    case .callout:
      return Font.custom("OpenSans-Regular", size: 12 * getScaleFactor())
    case .body:
      return Font.custom("OpenSans-Regular", size: 14 * getScaleFactor())
    case .headline:
      return Font.custom("OpenSans-Light", size: 32 * getScaleFactor())
    case .title:
      return Font.custom("OpenSans-Light", size: 24 * getScaleFactor())
    case .largeTitle:
      return Font.custom("OpenSans-Light", size: 32 * getScaleFactor())
    case .none:
      return Font.custom("OpenSans-Regular", size: 14 * getScaleFactor())
    @unknown default:
      return Font.custom("OpenSans-Regular", size: 14 * getScaleFactor())
    }
  }

  func getSywFont() -> Font {
    switch textStyle {
    case .subtitle:
      return Font.custom("OpenSans-Regular", size: 22 * getScaleFactor())
    case .none:
      return Font.custom("OpenSans-Regular", size: 14 * getScaleFactor())
    }
  }
}
