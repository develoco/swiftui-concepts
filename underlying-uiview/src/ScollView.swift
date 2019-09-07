import SwiftUI
import UIKit

extension ScrollView {
  func underlyingUIView(completion: @escaping (UIScrollView) -> ()) -> some View {
    self.overlay(ProbingView(completion: completion).frame(width: 0, height: 0))
  }
}
