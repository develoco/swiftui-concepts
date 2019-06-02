import SwiftUI

struct ViewBuilderClient: View {
  @usableFromInline var content: AnyView
  
  public var body: some View {
    content
  }
  
  @inlinable init<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>) where C0 : View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
    print("10")
    self.content = AnyView(content().value.9)
  }
  @inlinable public init<C0, C1, C2, C3, C4, C5, C6, C7, C8>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>) where C0 : View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
    print("9")
    self.content = AnyView(content().value.8)
  }
  @inlinable public init<C0, C1, C2, C3, C4, C5, C6, C7>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>) where C0 : View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
    print("8")
    self.content = AnyView(content().value.7)
  }
  @inlinable public init<C0, C1, C2, C3, C4, C5, C6>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4, C5, C6)>) where C0 : View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
    print("7")
    self.content = AnyView(content().value.6)
  }
  @inlinable public init<C0, C1, C2, C3, C4, C5>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4, C5)>) where C0 : View, C1: View, C2: View, C3: View, C4: View, C5: View {
    print("6")
    self.content = AnyView(content().value.5)
  }
  @inlinable public init<C0, C1, C2, C3, C4>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3, C4)>) where C0 : View, C1: View, C2: View, C3: View, C4: View {
    print("5")
    self.content = AnyView(content().value.4)
  }
  @inlinable public init<C0, C1, C2, C3>(@ViewBuilder content: () -> TupleView<(C0, C1, C2, C3)>) where C0 : View, C1: View, C2: View, C3: View {
    print("4")
    self.content = AnyView(content().value.3)
  }
  @inlinable public init<C0, C1, C2>(@ViewBuilder content: () -> TupleView<(C0, C1, C2)>) where C0 : View, C1: View, C2: View {
    print("3")
    self.content = AnyView(content().value.2)
  }
  @inlinable public init<C0, C1>(@ViewBuilder content: () -> TupleView<(C0, C1)>) where C0 : View, C1 : View {
    print("2")
    self.content = AnyView(content().value.1)
  }
  
  @inlinable  public init<Content>(@ViewBuilder content: () -> Content) where Content : View
  {
    print(type(of: content))
    print("1")
    self.content = AnyView(content())
  }
  
  @inlinable  public init<Content>(@ViewBuilder content: () -> Content?) where Content : View
  {
    print("0/1")
    self.content = AnyView(content())
  }
  
  @inlinable  public init(@ViewBuilder content: () -> EmptyView)
  {
    print("()")
    self.content = AnyView(content())
  }
  
  @inlinable  public init<TrueContent, FalseContent>(@ViewBuilder content: () -> _ConditionalContent<TrueContent, FalseContent>) where TrueContent : View, FalseContent : View
  {
    print("0?")
    self.content = AnyView(content())
  }
  
//  @inlinable public init(content: () -> ()) {
//    print("$$@$#%")
//    print(type(of: content))
//    self.content = AnyView(EmptyView())
//  }
}
