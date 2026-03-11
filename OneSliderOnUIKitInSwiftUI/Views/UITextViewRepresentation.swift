import SwiftUI

struct UITextViewRepresentation: UIViewRepresentable {
    let theWord: String
    let theColor: Color
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = theWord
        label.textColor = UIColor(theColor)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = theWord
    }
}

#Preview {
    UITextViewRepresentation(theWord: "10", theColor: .green)
}
