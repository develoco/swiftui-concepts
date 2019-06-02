import SwiftUI

public struct WStack<Content> : View where Content : View {
  @usableFromInline var content: Content
  
  @inlinable public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  public var body: some View {
    content
  }
}

public struct AStack: View {

  @usableFromInline var content: AnyView
  @inlinable public init<C0: View, C1: View>(content: TupleView<(C0, C1)> ) {
    print(":D")
    self.content = AnyView(content)
  }
  @inlinable public init<C: View>(content: C) {
    print(":( :(")
    print(type(of: content))
    self.content = AnyView(content)
  }

    @inlinable public init<C: View>(@ViewBuilder content: () -> C) {
      self.init(content: content())
//      print(":?")
//      print(type(of: content))
//      self.content = AnyView(content())
    }
  
  public var body: some View {
    content
  }
}

//public extension AStack {
//  @inlinable init<T>(@ViewBuilder content: () -> TupleView<T> ) where C == TupleView<T> {
//    print(":D")
//    self.content = AnyView(content())
//  }
//}
//
