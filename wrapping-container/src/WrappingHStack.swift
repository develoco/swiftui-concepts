import SwiftUI

struct WrappingHStack<Content: View>: View {

  var alignment: VerticalAlignment
  var spacing: CGFloat
  var content: [Content]
  @State private var height: CGFloat = 0

  @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat = 0, content: () -> [Content]) {
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }
  
  var body: some View {
    GeometryReader { p in
      WrappingStack (
        width: p.frame(in: .global).width,
        verticalAlignment: self.alignment,
        spacing: self.spacing,
        content: self.content
      )
      .anchorPreference(
        key: SizePref.self,
        value: .bounds,
        transform: {
          p[$0].size
        }
      )
    }
    .frame(height: height)
    .onPreferenceChange(SizePref.self, perform: {
      self.height = $0.height
    })
  }
}

struct WrappingHStack_Previews: PreviewProvider {

  static var previews: some View {
    VStack {
      Text("Header")
      Spacer()
      WrappingHStack(alignment: .bottom, spacing: 10) {[
          AnyView(Color.red.frame(width: 100, height: 50)),
          AnyView(Spacer()),
          AnyView(Color.gray.frame(width: 80, height: 50)),
          AnyView(Color.green.frame(width: 150, height: 30)),
//          Color.yellow.frame(width: 150, height: 70),
//          Color.orange.frame(width: 50, height: 50),
//          Color.purple.frame(width: 50, height: 50),
//          Color.blue.frame(width: 50, height: 50),
//          Color.gray.frame(width: 50, height: 50),
//          Color.green.frame(width: 50, height: 50),
      ]}
      .frame(width: 350)
      .border(Color.black, width: 1)
      Spacer()
      Text("Footer")
    }
  }
}
