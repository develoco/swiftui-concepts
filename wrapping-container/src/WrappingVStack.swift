import SwiftUI

struct WrappingVStack<Content: View>: View {

  var alignment: HorizontalAlignment
  var spacing: CGFloat
  var content: [Content]
  
  @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat = 0, content: () -> [Content]) {
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }

  var body: some View {
    GeometryReader { proxy in
      WrappingStack(
        height: proxy.frame(in: .global).height,
        horizontalAlignment: self.alignment,
        spacing: self.spacing,
        content: self.content
      )
    }
  }
}

struct WrappingVStack_Previews: PreviewProvider {

  static var previews: some View {
    WrappingVStack(alignment: .center, spacing: 10) {[
      Color.red.frame(width: 150, height: 100),
      Color.green.frame(width: 50, height: 150),
      Color.yellow.frame(width: 100, height: 150),
      Color.orange.frame(width: 50, height: 50),
      Color.purple.frame(width: 30, height: 50),
      Color.blue.frame(width: 50, height: 50),
      Color.gray.frame(width: 50, height: 50),
      Color.green.frame(width: 50, height: 50),
      Color.yellow.frame(width: 100, height: 150),
      Color.orange.frame(width: 50, height: 50),
      Color.purple.frame(width: 30, height: 50),
      Color.red.frame(width: 150, height: 100),
      Color.green.frame(width: 50, height: 150),
      Color.yellow.frame(width: 100, height: 150),
      Color.orange.frame(width: 50, height: 50),
      Color.purple.frame(width: 30, height: 50),
      Color.blue.frame(width: 50, height: 50),
      Color.gray.frame(width: 50, height: 50),
      Color.green.frame(width: 50, height: 50),
      Color.blue.frame(width: 50, height: 50),
      Color.gray.frame(width: 50, height: 50),
      Color.green.frame(width: 50, height: 50),
    ]}
    //.frame(height: 350)
    .border(Color.black, width: 1)
  }
}
