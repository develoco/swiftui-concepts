import SwiftUI

struct MyPreferenceData {
  let bounds: Anchor<CGRect>!
}

struct MyPreferenceKey: PreferenceKey {
  static var defaultValue = MyPreferenceData(bounds: nil)
  static func reduce(value: inout MyPreferenceData, nextValue: () -> MyPreferenceData) {
    value = nextValue()
  }
}

struct LittleSquare: View {
  @State private var visible = false
  var body: some View {
    Color.red
      .opacity(visible ? 1 : 0)
      .frame(width: 25, height: 25)
      .onAppear {
        withAnimation(.easeInOut(duration: 0.5)) { self.visible = true }
      }
  }
}

struct ScrollOffset: View {
  
  var button: some View {
    GeometryReader { g in
      Button(action: {
        print("Y position in local \(g.frame(in: .local).origin.y)")
        print("Y position in global \(g.frame(in: .global).origin.y)")
        print("Y position in scrollview \(g.frame(in: .named("scrollview")).origin.y)")
        print("Y position in vstack \(g.frame(in: .named("vstack")).origin.y)")
      }) {
        Color.black.frame(width: 200, height: 200)
      }
    }
  }
  
  func createInfo(_ g: GeometryProxy, _ p: MyPreferenceData) -> some View {
    if p.bounds != nil {
      let y = g[p.bounds].origin.y
      let h = g[p.bounds].size.height
      if (y - 48 > -h) {
        return AnyView(
          Text("y: \(y)")
        )
      } else {
        return AnyView(LittleSquare())
      }
    }
    return AnyView(Text("N/A"))
  }
  
  var body: some View {
    ZStack {
      VStack {
        Color.clear.frame(height: 40).frame(maxWidth: .infinity)
        ScrollView(.vertical) {
          VStack {
            Color.red.frame(width: 200, height: 200)
              .anchorPreference(
                key: MyPreferenceKey.self,
                value: .bounds,
                transform: {
                  MyPreferenceData(bounds: $0)
                }
              )
            Color.purple.frame(width: 200, height: 200)
            Color.green.frame(width: 200, height: 200)
            // button
            Color.yellow.frame(width: 200, height: 200)
            Color.blue.frame(width: 200, height: 200)
            Color.orange.frame(width: 200, height: 200)
          }
        }
        Text("Footer")
      }
    }
    //.onPreferenceChange(MyPreferenceKey.self) { print("\($0)") }
    .backgroundPreferenceValue(MyPreferenceKey.self, { p in
      GeometryReader { g in
        return ZStack {
          self.createInfo(g, p)
        }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      }
    })
  }
}

struct ScrollOffset_Previews: PreviewProvider {
  static var previews: some View {
    ScrollOffset()
  }
}
