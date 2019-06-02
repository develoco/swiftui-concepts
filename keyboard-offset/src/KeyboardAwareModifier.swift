import SwiftUI

@usableFromInline struct KeyboardAwareModifier: ViewModifier {

  @ObservedObject var keyboardProps = KeyboardProperties.shared

  @usableFromInline init() {}

  @usableFromInline func body(content: Content) -> some View {
    content
    .environment(\.keyboardHeight, keyboardProps.height)
    .offset(y: -keyboardProps.height)
    .animation(.easeIn(duration: 0.2))
  }
}
