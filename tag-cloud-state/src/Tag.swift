struct Tag {
  var label: String
  var isOn = false
}

extension Tag: Identifiable {
  var id: some Hashable {
    label.hash
  }
}
