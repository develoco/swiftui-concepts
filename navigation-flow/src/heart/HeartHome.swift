import SwiftUI

struct HeartHome: View {

  var goToNext: () -> () = {}

  var body: some View {
    ScrollView(.vertical) {
      VStack {
        Text("Home of Hearts")
        .font(.largeTitle)
        .padding()
        Text("""
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Feugiat nisl pretium fusce id velit ut. Mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Neque vitae tempus quam pellentesque. Ante metus dictum at tempor commodo ullamcorper a. Eget felis eget nunc lobortis. Mollis nunc sed id semper risus in. Malesuada pellentesque elit eget gravida cum sociis natoque penatibus et. Sit amet risus nullam eget felis eget. In arcu cursus euismod quis viverra nibh cras. Viverra suspendisse potenti nullam ac tortor vitae. Euismod elementum nisi quis eleifend. Tempus egestas sed sed risus pretium quam vulputate. Purus faucibus ornare suspendisse sed nisi. Adipiscing commodo elit at imperdiet. Duis ut diam quam nulla porttitor massa id. Sollicitudin ac orci phasellus egestas tellus. Ac auctor augue mauris augue neque gravida in fermentum. Iaculis eu non diam phasellus vestibulum lorem sed.

        Suspendisse in est ante in nibh mauris cursus mattis molestie. Lorem ipsum dolor sit amet consectetur. Tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Tellus rutrum tellus pellentesque eu. Maecenas ultricies mi eget mauris. Condimentum lacinia quis vel eros donec. Egestas purus viverra accumsan in nisl nisi. At volutpat diam ut venenatis tellus in. Fringilla ut morbi tincidunt augue interdum velit. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Mi bibendum neque egestas congue quisque egestas diam.

        Aliquam sem fringilla ut morbi tincidunt augue interdum. In ornare quam viverra orci. Fermentum posuere urna nec tincidunt praesent semper. Arcu vitae elementum curabitur vitae nunc. Ultricies mi quis hendrerit dolor magna eget. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim. Aliquam ut porttitor leo a diam sollicitudin tempor id. Id leo in vitae turpis massa sed elementum tempus. Dolor magna eget est lorem ipsum dolor sit amet consectetur. In fermentum posuere urna nec tincidunt. Laoreet id donec ultrices tincidunt arcu non.

        Gravida rutrum quisque non tellus orci. Pellentesque dignissim enim sit amet venenatis urna. Velit scelerisque in dictum non consectetur. Risus commodo viverra maecenas accumsan lacus vel. Pellentesque pulvinar pellentesque habitant morbi tristique senectus. Sed turpis tincidunt id aliquet risus. Aenean sed adipiscing diam donec adipiscing. Etiam dignissim diam quis enim lobortis. Erat imperdiet sed euismod nisi porta lorem mollis aliquam. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Laoreet id donec ultrices tincidunt. Rhoncus urna neque viverra justo nec. Purus non enim praesent elementum facilisis. Mi bibendum neque egestas congue quisque egestas. Duis convallis convallis tellus id interdum velit laoreet. A erat nam at lectus urna duis convallis. Sapien nec sagittis aliquam malesuada. Enim diam vulputate ut pharetra sit amet aliquam id. Non consectetur a erat nam at.

        Porttitor eget dolor morbi non arcu risus. Est ullamcorper eget nulla facilisi etiam dignissim. Aliquam vestibulum morbi blandit cursus. Non blandit massa enim nec dui nunc mattis. Dolor sit amet consectetur adipiscing elit ut aliquam purus. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Id diam vel quam elementum pulvinar. Mauris in aliquam sem fringilla ut morbi tincidunt. Magna fringilla urna porttitor rhoncus dolor purus. Eget nulla facilisi etiam dignissim diam quis. Pellentesque eu tincidunt tortor aliquam nulla facilisi. Bibendum ut tristique et egestas quis ipsum suspendisse. In ornare quam viverra orci.
        """)
      }
      .padding()
    }
    .overlay(
      VStack {
        Spacer()
        Button("Two Hearts", action: goToNext)
        .padding()
        .background(Color.white)
        .border(Color.accentColor, width: 1)
        .padding()
      }
    )
  }
}

struct HeartHome_Previews: PreviewProvider {
  static var previews: some View {
    HeartHome()
  }
}
