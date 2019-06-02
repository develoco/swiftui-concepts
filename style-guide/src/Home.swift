import SwiftUI

struct Home: View {

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        Text("Navigate to different sections of this style guide.")
        .padding()
        Spacer()
        List {
          NavigationLink("Text", destination:
            TextStyleGuide()
              .navigationBarTitle("Text styles")
          )
        }
        Spacer()
        Text("Style Guide © 2020")
        Spacer()
      }
      .navigationBarTitle("Style guide")
    }

    .modifier(RootStylesModifier())
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct TextStyleGuide: View {

  @EnvironmentObject var metrics: Metrics

  var body: some View {
    VStack(spacing: metrics.spacingLarge) {
      Text("This is body.") + Text("This is body bold.").bold() + Text("This is body italic.").italic()
      Text("This is largeTitle.").font(.largeTitle)
      Text("This is title.").font(.title)
    }.padding()
  }
}
