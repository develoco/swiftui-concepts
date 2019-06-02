import SwiftUI

struct Home: View {
  
  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        Spacer(minLength: 25).fixedSize()
        NavigationLink("Simple", destination:
          SimpleTagAdd()
          .navigationBarTitle("Simple")
        )
        NavigationLink("Fancy", destination:
          FancyTagAdd())
          .navigationBarTitle("Fancy")
        Spacer()
      }
      .navigationBarTitle("Adding Tags")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
