import SwiftUI

extension View {
  @inlinable public func customFont(_ textStyle: Font.TextStyle = .body) -> some View {
    self.modifier(TextStyleModifier(textStyle))
  }

  @inlinable public func customFont(_ textStyle: TextStyle = .subtitle) -> some View {
    self.modifier(TextStyleModifier(textStyle))
  }
}
