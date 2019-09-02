import SwiftUI
import Combine
import CoreGraphics
import Foundation

class GameModel: ObservableObject {

  @Published var shipPosition: CGPoint = .init(x: 0, y: 0)
  var shot = PassthroughSubject<CGPoint, Never>()

  var shotFired: AnyPublisher<CGPoint, Never> {
    shot
      .debounce(for: 0.5, scheduler: RunLoop.main)
      .removeDuplicates()
      .eraseToAnyPublisher()
  }
}
