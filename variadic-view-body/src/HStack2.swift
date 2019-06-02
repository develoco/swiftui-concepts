import SwiftUI
// xed /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/SwiftUI.framework/Modules/SwiftUI.swiftmodule/arm64.swiftinterface

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct _HStack2Layout {
  public var alignment: VerticalAlignment
  public var spacing: CGFloat?
  @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
  public typealias AnimatableData = EmptyAnimatableData
  public typealias Body = Swift.Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension _HStack2Layout : SwiftUI._VariadicView_UnaryViewRoot {}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension _HStack2Layout : Animatable {}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct HStack2<Content> : View where Content : View {
  @usableFromInline

  internal var _tree: SwiftUI._VariadicView.Tree<_HStack2Layout, Content>

  @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        // Wrong: should call constructor below
        _tree = .init(_HStack2Layout(alignment: alignment, spacing: spacing), content: content)
        //_tree = .init(
        //  root: _HStack2Layout(alignment: alignment, spacing: spacing),
        //  content: content()
        //)
    }

  public static func _makeView(view: SwiftUI._GraphValue<HStack2<Content>>, inputs: SwiftUI._ViewInputs) -> SwiftUI._ViewOutputs
  {
    //view[\._tree][\.root][\.alignment]
    //view[\._tree][\.content][\.body]
    //view[\.body]

    // Wrong, calls itself
    return self._makeView(view: view, inputs: inputs) // Wrong, not _ViewOutputs
  }

  //public typealias Body = Swift.Never
  public var body: some View {
    HStack {
      Text("foo") // Wrong
    }
  }
}
