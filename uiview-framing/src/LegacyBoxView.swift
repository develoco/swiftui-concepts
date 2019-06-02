import SwiftUI

class BoxView: UIView {
  override var intrinsicContentSize: CGSize {
    bounds.size
  }
}

struct LegacyBoxView: UIViewRepresentable {

  @Binding var big: Bool

  func makeUIView(context: Context) -> BoxView {
    let view = BoxView()
    view.backgroundColor = .magenta
    return view
  }

  func updateUIView(_ view: BoxView, context: Context) {
    if big {
      view.bounds = CGRect(x: 0, y: 0, width: 40, height: 80)
    } else {
      view.bounds = CGRect(x: 0, y: 0, width: 20, height: 10)
    }
  }
}

struct LegacyBoxView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LegacyBoxView(big: .constant(true))
        .fixedSize()
        .previewLayout(.sizeThatFits)
      LegacyBoxView(big: .constant(false))
        .fixedSize()
        .previewLayout(.sizeThatFits)
    }
  }
}
