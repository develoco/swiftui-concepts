import SwiftUI
import Combine

fileprivate struct FrameModifier: ViewModifier {

  var horizontalAlignment: HorizontalAlignment

  func body(content: Content) -> some View {
    Group {
      if horizontalAlignment == .center {
        content
      } else {
        content.frame(maxWidth: 300, alignment: Alignment(horizontal: horizontalAlignment, vertical: .center))
      }
    }
  }
}

struct LoopCarousel: View {

  @State var cards: [String]
  @State var current: Int = 0 // or 3
  var verticalAlignment = VerticalAlignment.center
  var horizontalAlignment = HorizontalAlignment.center
  var spacing: CGFloat = 16
  var peekOffset: CGFloat = 0
  var loop: Bool = false

  private var realCurrent: Int {
    current % cards.count
  }
  
  private var indices: Range<Int> {
    loop
      ? -0..<cards.count * 3
      : 0..<cards.count
  }

  private var multiplier: CGFloat {
    horizontalAlignment == .center
    ? CGFloat(cards.count / 2 - realCurrent)
    : horizontalAlignment == .leading
    ? -CGFloat(current)
    : CGFloat(cards.count - realCurrent - 1)
  }

  private var loopMultiplier: CGFloat {
    !loop
    ? 0
    : horizontalAlignment == .trailing
    ? CGFloat(cards.count)
    : 0
  }

  private var signedPeekOffset: CGFloat {
    horizontalAlignment == .leading
    ? peekOffset
    : -peekOffset
  }

  private var offset: CGFloat {
     multiplier * (Card.normalWidth + spacing) + loopMultiplier * (Card.normalWidth + spacing) + signedPeekOffset
  }

  func onSelect(_ index: Int) -> () {
    let jump = abs(current - index)
    if (loop && index >= cards.count * 2) {
      current = cards.count + (index % cards.count) - jump
      withAnimation {
        current += jump
      }
    } else if (loop && index < cards.count) {
      current = cards.count + (index % cards.count) + jump
      withAnimation {
        current -= jump
      }
    } else {
      withAnimation {
        current = index
      }
    }
  }

  var body: some View {
    VStack {
      Text("Current: \(current) offset \(offset)")
      HStack(spacing: 0) {
        HStack(alignment: verticalAlignment, spacing: spacing) {
          ForEach(indices, id: \.self) { index in
            Card(content: self.cards[index % self.cards.count], isSelected: .constant(self.current == index))
              .onTapGesture { self.onSelect(index) }
          }
        }
        .offset(x: offset)
      }
      .frame(height: 170)
      .modifier(
        FrameModifier(horizontalAlignment: horizontalAlignment)
      )
      .clipped()
      .background(Color.purple)
    }
  }
}

struct LoopCarousel_Previews: PreviewProvider {
  @State static var cards = ["foo", "bar", "baz"]
  static var previews: some View {
    Group {
      LoopCarousel(cards: cards)
        .previewDisplayName("Centered, no loop (default)")
      LoopCarousel(cards: cards, current: 1)
        .previewDisplayName("Second item selected")
      LoopCarousel(cards: cards, spacing: 8)
        .previewDisplayName("Less spacing (8)")
      LoopCarousel(cards: cards, verticalAlignment: .top)
        .previewDisplayName("Top aligned")
      LoopCarousel(cards: cards, horizontalAlignment: .leading, peekOffset: 32)
        .previewDisplayName("Left (lead) aligned")
      LoopCarousel(cards: cards, current: 2, horizontalAlignment: .trailing, peekOffset: 32)
        .previewDisplayName("Right (trail) aligned")
      LoopCarousel(cards: cards, current: cards.count, loop: true)
        .previewDisplayName("Loop")
      LoopCarousel(cards: cards, current: cards.count, horizontalAlignment: .leading, peekOffset: 32, loop: true)
        .previewDisplayName("Loop, left aligned")
      LoopCarousel(cards: cards, current: cards.count, horizontalAlignment: .trailing, peekOffset: 32, loop: true)
        .previewDisplayName("Loop, right aligned")
    }
    .previewLayout(.sizeThatFits)
  }
}
