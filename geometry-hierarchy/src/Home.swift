import SwiftUI

struct Home: View {
  
  private struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .init(width: 0, height: 0)
    static func reduce(value: inout CGSize , nextValue: () -> CGSize) {
      value = nextValue()
    }
  }
  
  @State private var width: CGFloat = 0
  @State private var height: CGFloat = 0
  
  var body: some View {
    GeometryReader { p in
      Text("Width: \(p.frame(in: .global).width)\nHeight: \(p.frame(in: .global).height)\nReported height: \(self.height)")
      .fixedSize()
      .anchorPreference(
        key: HeightPreferenceKey.self,
        value: .bounds,
        transform: {
          p[$0].size
        }
      )
    }
    .frame(width: width, height: height)
    .onPreferenceChange(HeightPreferenceKey.self, perform: {
      self.width = $0.width
      self.height = $0.height
    })
    .border(Color.red, width: 1)
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
    //.previewLayout(.sizeThatFits)
  }
}
