import SwiftUI

public extension View {

  @inlinable func keyboardAware() -> some View {
    self.modifier(KeyboardAwareModifier())
  }

}
