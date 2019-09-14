import SwiftUI
import Combine

fileprivate struct FrameModifier: ViewModifier {

  var horizontalAlignment: HorizontalAlignment

  func body(content: Content) -> some View {
    Group {
      if horizontalAlignment == .center {
        content
      } else {
        content.frame(maxWidth: 350, alignment: Alignment(horizontal: horizontalAlignment, vertical: .center))
      }
    }
  }
}

struct LoopCarousel: View {

  var cards: [String]
  var verticalAlignment: VerticalAlignment
  var horizontalAlignment: HorizontalAlignment
  var spacing: CGFloat
  var peekOffset: CGFloat
  var loop: Bool
  @State private var current: Int

  init(
    cards: [String],
    initialSelection: Int = 0,
    verticalAlignment: VerticalAlignment = .center,
    horizontalAlignment: HorizontalAlignment = .center,
    spacing: CGFloat = 16,
    peekOffset: CGFloat = 0,
    loop: Bool = false
  ) {
    self.cards = cards
    self.verticalAlignment = verticalAlignment
    self.horizontalAlignment = horizontalAlignment
    self.spacing = spacing
    self.peekOffset = peekOffset
    self.loop = loop
    _current = State(initialValue: initialSelection % cards.count + (loop ? cards.count : 0))
  }

  private var loopCount: Int {
    cards.count * (loop ? 3 : 1)
  }
  
  private var cardWidth: CGFloat {
    Card.normalWidth + spacing
  }

  private var evenShift: CGFloat {
    loopCount.isMultiple(of: 2)
    ? -cardWidth / 2
    : 0
  }
  
  private var offset: CGFloat {
    horizontalAlignment == .center
    ? cardWidth * CGFloat(loopCount / 2 - current) + evenShift
    : horizontalAlignment == .leading
    ? peekOffset - cardWidth * CGFloat(current)
    : cardWidth * CGFloat(loopCount - current - 1) - peekOffset
  }

  func onSelect(_ index: Int) -> () {
    let jump = abs(current - index)
    if (loop && index >= cards.count * 2) {
      current = cards.count + (index % cards.count) - jump
      withAnimation { current += jump }
    } else if (loop && index < cards.count) {
      current = cards.count + (index % cards.count) + jump
      withAnimation { current -= jump }
    } else {
      withAnimation { current = index }
    }
  }

  var body: some View {
    VStack {
      Text("Current: \(current) offset \(offset)")
      HStack(spacing: 0) {
        HStack(alignment: verticalAlignment, spacing: spacing) {
          ForEach(0 ..< loopCount) { i in
            Card(content: self.cards[i % self.cards.count], isSelected: .constant(self.current == i))
              .onTapGesture { self.onSelect(i) }
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
      LoopCarousel(cards: cards, initialSelection: 1)
        .previewDisplayName("Second item selected")
      LoopCarousel(cards: cards, spacing: 8)
        .previewDisplayName("Less spacing (8)")
      LoopCarousel(cards: cards, verticalAlignment: .top)
        .previewDisplayName("Top aligned")
      LoopCarousel(cards: cards, horizontalAlignment: .leading, peekOffset: 32)
        .previewDisplayName("Left (lead) aligned")
      LoopCarousel(cards: cards, initialSelection: 2, horizontalAlignment: .trailing, peekOffset: 32)
        .previewDisplayName("Right (trail) aligned")
      LoopCarousel(cards: cards, initialSelection: cards.count, loop: true)
        .previewDisplayName("Loop")
      LoopCarousel(cards: cards, initialSelection: cards.count, horizontalAlignment: .leading, peekOffset: 32, loop: true)
        .previewDisplayName("Loop, left aligned")
      LoopCarousel(cards: cards, initialSelection: cards.count * 4, horizontalAlignment: .trailing, peekOffset: 32, loop: true)
        .previewDisplayName("Loop, right aligned")
    }
    .previewLayout(.sizeThatFits)
  }
}
