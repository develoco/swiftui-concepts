import SwiftUI

fileprivate func simulateNetworkCall(completion: @escaping ([String]) -> ()) -> () {
  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    completion(["bar"])
  }
}

struct Home: View {

  @State var labels = ["foo", "bar", "baz"]
  @State var waiting = true
  @State var selectedLabels: [String]! = nil
  @State var tags: [Tag] = [] // FIXME: Cant make it optional

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      TagDisplay(title: "Available tags", labels: labels)
      if (waiting) {
        Text("Waiting for additional data…")
      } else {
        TagDisplay(title: "Original selection", labels: selectedLabels)
        TagDisplay(title: "Current selection", labels: tags.filter { $0.isOn }.map { $0.label })
        Toggles(tags: $tags)
        Tags(tags: $tags)
      }
      Spacer()
    }
    .padding()
    .onAppear {
      simulateNetworkCall { selectedLabels in
        self.waiting = false
        self.selectedLabels = selectedLabels
        self.tags = self.labels.map {
          Tag(
            label: $0,
            isOn: selectedLabels.contains($0)
          )
        }
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Home()
        .previewDisplayName("Loading")
      Home(
        labels: ["foo", "bar"],
        waiting: false,
        selectedLabels: ["bar"],
        tags: [
          Tag(label: "foo"),
          Tag(label: "bar", isOn: true)
        ]
      )
      .previewDisplayName("With selection")
    }
  }
}
