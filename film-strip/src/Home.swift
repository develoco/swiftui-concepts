import SwiftUI

struct Home: View {

  let all:[Item] = ["A", "B", "C", "D"].map { Item(label: $0) }
  static let placeholder = Item(label: "?")
  @State var current = 0
  @State var tempItems:[Item] = [placeholder, placeholder, placeholder]
  @State var tempOffset: CGFloat = 0

  var up: some View {
    Image(systemName: "arrow.up")
    .resizable()
    .frame(width: 50, height: 50)
    .foregroundColor(.accentColor)
  }

  var controls: some View {
    HStack {
      Button("Next") {
        self.tempOffset = 0
        self.tempItems[0] = Self.placeholder
        self.tempItems[1] = self.all[self.current]
        self.tempItems[2] = self.all[self.current + 1]
        withAnimation {
          self.tempOffset = -50
        }
        self.current += 1
      }
      Button("Back") {
        self.tempOffset = 0
        self.tempItems[0] = self.all[self.current - 1]
        self.tempItems[1] = self.all[self.current]
        self.tempItems[2] = Self.placeholder
        withAnimation {
          self.tempOffset = 50
        }
        self.current -= 1
      }
      Button("Home") {
        self.tempOffset = 0
        self.tempItems[0] = self.all[0]
        self.tempItems[1] = self.all[self.current]
        self.tempItems[2] = Self.placeholder
        withAnimation {
          self.tempOffset = 50
        }
        self.current = 0
      }
    }
    .padding()
  }

  var items: some View {
    VStack {
      Items(elements: all)
      up
      .offset(x: CGFloat(current) * 50 - 2 * 50 + 25)
      .animation(.easeOut)
    }
  }

  var white: some View {
    Color.white.frame(height: 50).opacity(0.9)
  }

  var mask: some View {
    HStack(spacing: 0) {
      white
      Spacer(minLength: 50).fixedSize()
      white
    }
  }

  var body: some View {
    VStack {
      items
      controls
      Arrow(direction: "down")
      ZStack {
        Items(elements: tempItems)
        .offset(x: tempOffset)
        mask
      }
      Arrow()
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
