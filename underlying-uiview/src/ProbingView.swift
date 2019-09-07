import SwiftUI
import UIKit

public struct ProbingView: UIViewRepresentable {
    
    let completion: (UIScrollView) -> ()
    
    public func makeUIView(context: Context) -> UIView {
        UIView()
    }

    public func updateUIView(
        _ uiView: UIView,
        context: Context
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
        let siblings = uiView.superview!.superview!.subviews
        let parent = siblings.first { NSStringFromClass(type(of: $0)).contains("ViewHost") }!
            self.completion(parent.subviews[0] as! UIScrollView)
        }
    }
}
