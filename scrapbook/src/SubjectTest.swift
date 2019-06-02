import SwiftUI
import Combine

struct SubjectTest: View {
  
  private let pingSubject =
    PassthroughSubject<String, Never>()
  private let debouncedSubject =
    PassthroughSubject<String, Never>()
  private let throttledSubject =
    PassthroughSubject<String, Never>()
  
  var debounced: AnyPublisher<String, Never> {
    debouncedSubject
      .debounce(for: 1, scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  var throttled: AnyPublisher<String, Never> {
    throttledSubject
      .throttle(for: 3, scheduler: RunLoop.main, latest: true)
      .eraseToAnyPublisher()
  }
  
  @State var lastPing: String!
  @State var pingCount = 0
  @State var debouncedCount = 0
  @State var throttledCount = 0
  
  struct GreaterThanThree: ViewModifier {
    var condition: Bool
    func body(content: Content) -> some View {
      Group {
        if condition {
          content
            .foregroundColor(.red)
        } else {
          content
        }
      }
    }
  }
  
  var body: some View {
    VStack(spacing: 16) {
      Button("Ping count: \(pingCount)") {
        self.pingSubject.send("ping")
        // Following does not work
        self.debouncedSubject.send("ping")
      }
      Button("Debounce count \(debouncedCount)") {
        self.debouncedSubject.send("debounce")
      }
      Button("Throttle count \(throttledCount)") {
        self.throttledSubject.send("throttle")
      }
      Text("Last ping text is \(lastPing ?? "N/A")")
        .font(.title)
        .modifier(
            GreaterThanThree(condition: pingCount > 3)
        )
        .padding()
    }
    .onReceive(pingSubject) {
      self.lastPing = $0
      self.pingCount += 1
    }
    .onReceive(debounced) { _ in
      self.debouncedCount += 1
    }
    .onReceive(throttled) { _ in
      self.throttledCount += 1
    }
  }
}

struct SubjectTest_Previews: PreviewProvider {
  static var previews: some View {
    SubjectTest()
  }
}
