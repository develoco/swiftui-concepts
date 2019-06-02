import SwiftUI

struct RootStylesModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .environmentObject(Metrics())
      .environment(\.font, .body)
      .accentColor(Color("accent"))
      .buttonStyle(DefaultButtonStyle())
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .toggleStyle(DefaultToggleStyle())
      .pickerStyle(DefaultPickerStyle())
      .datePickerStyle(DefaultDatePickerStyle())
      .navigationViewStyle(DefaultNavigationViewStyle())
      .listStyle(DefaultListStyle())
  }
}

struct RootStylesModifier_Previews: PreviewProvider {
  static var previews: some View {
    Home()
      .modifier(RootStylesModifier())
  }
}
