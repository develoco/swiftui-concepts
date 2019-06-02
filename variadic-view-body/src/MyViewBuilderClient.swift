import SwiftUI

struct MyViewBuilderClient: View {
  var content: AnyView
  
  public var body: some View {
    content
  }

  init<C0, C1>(@MyViewBuilder _ content: @escaping () -> TupleView<(C0, C1)>) where C0 : View, C1 : View {
    print(type(of: content))
    print("2")
    self.content = AnyView(content().value.1)
  }
  
  init<Content>(@MyViewBuilder _ content: () -> Content) where Content : View
  {
    print(type(of: content))
    print("1")
    let co = content()
    // let m = Mirror(reflecting: type(of: co))
    if type(of: co) is (ForEach<Array<IdView<Text>>, Int, IdView<Text>>).Type {
     print("yea")
    } else {
    print("no")
    }
    self.content = AnyView(content())
  }
  
  init(@MyViewBuilder _ content: () -> EmptyView) {
    print(type(of: content))
    print("0")
    self.content = AnyView(content())
  }
}

struct IdView<C: View>: Identifiable, View {
  var id: Int
  var content: C
  var body: some View {
    content
  }
}
