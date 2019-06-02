import SwiftUI

public extension EnvironmentValues {

  var keyboardHeight: CGFloat {
    set { self[KeyboardHeightKey.self] = newValue }
    get { self[KeyboardHeightKey.self] }
  }

}
