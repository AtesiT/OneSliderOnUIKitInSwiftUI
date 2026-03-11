import SwiftUI

struct UIButtonViewRepresentation: UIViewRepresentable {
    let theColor: Color
    let textButton: String
    
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(theColor)
        button.setTitle(textButton, for: .normal)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
}

#Preview {
    UIButtonViewRepresentation(theColor: .blue, textButton: "Button")
}
