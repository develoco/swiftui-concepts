import SwiftUI

@_functionBuilder public struct MyViewBuilder {
    public static func buildBlock() -> EmptyView {
      return EmptyView()
    }
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : View {
      return content
    }
//    public static func buildIf<Content>(_ content: Content?) -> Content? where Content : View
//
//    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View
//
//    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View {
      TupleView((c0, c1))
    
  }
}
