import SwiftUI

struct UniformWrappingHStack<Content: View>: View {

  var width: CGFloat = 350
  var blockWidth: CGFloat = 100
  var lineHeight: CGFloat = 50
  var content: [Content]

  var blocksPerLine: Int {
    Int(width / blockWidth)
  }
  
  var wholeLines: Int {
    content.count / blocksPerLine
  }
  
  var hasExtraLine: Bool {
    content.count - blocksPerLine * wholeLines > 0
  }
  
  var lines: Int {
    wholeLines + (hasExtraLine ? 1 : 0)
  }
  
  var limits: [Int] {
    (0..<lines).map { line in
      blocksPerLine * line
    }
  }
  
  func lowerLimit(_ index: Int) -> Int {
    limits[index]
  }

  func upperLimit(_ index: Int) -> Int {
    if index == lines - 1 {
      return content.count
    }
    return limits[index + 1]
  }

  var body: some View {
    VStack {
      ForEach(0..<lines, id: \.self) { line in
        HStack(spacing: 0) {
          ForEach(self.lowerLimit(line) ..< self.upperLimit(line), id: \.self) { i in
            self.content[i]
              .frame(width: self.blockWidth, height: self.lineHeight)
          }
        }
        .frame(width: self.width, alignment: .leading)
        .clipped()
      }
    }
  }
}

struct UniformWrappingHStack_Previews: PreviewProvider {

  static var previews: some View {
    UniformWrappingHStack(
      content: [
        Color.red,
        Color.green,
        Color.red,
        Color.green,
      ]
    )
  }
}
