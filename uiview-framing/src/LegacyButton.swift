import SwiftUI

struct LegacyButton: UIViewRepresentable {

class Coordinator: NSObject {
    var parent: LegacyButton

    init(_ parent: LegacyButton) {
      self.parent = parent
    }

    @objc
    func callAction(sender: UIButton) {
      parent.action()
    }
  }

  var action: () -> ()
  var title: String

  func makeCoordinator() -> Coordinator { Coordinator(self) }

  func makeUIView(context: Context) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(
      context.coordinator,
      action: #selector(Coordinator.callAction(sender:)),
      for: .touchUpInside
    )
    return button
  }

  func updateUIView(_ button: UIButton, context: Context) {
    button.setTitle(title, for: .normal)
  }
}

struct LegacyButton_Previews: PreviewProvider {
  static var previews: some View {
    LegacyButton(action: {}, title: "bar")
      .fixedSize()
      .previewLayout(.sizeThatFits)
  }
}
