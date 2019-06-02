import SwiftUI

struct Home: View {

  var body: some View {
        AStack {
          Text("foo")
          Text("bar")
        }
    //    MyViewBuilderClient {
    //      Text("foo")
    //      Text("bar")
    //    }
    //    MyViewBuilderClient {
    //      Text("foo")
    //      Text("bar")
    //    }
    //  WStack {
    //    Text("hello")
    //      Text("hello")
    //    }
    //    ViewBuilderClient {
    //      Text("foo")
    //      Text("bar")
    //      ViewBuilder.buildBlock(
    //        Text("foo")
    //        ,
    //        Text("bar")
    //      )
    //    }

  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
