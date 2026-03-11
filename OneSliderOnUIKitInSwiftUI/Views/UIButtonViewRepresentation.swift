import SwiftUI

struct UIButtonViewRepresentation: UIViewRepresentable {
    let theColor: Color
    let textButton: String
    let action: () -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func buttonTapped() {
            action()
        }
    }
    
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(theColor)
        button.setTitle(textButton, for: .normal)
        
        button.addTarget(
            context.coordinator,
            action: #selector(Coordinator.buttonTapped),
            for: .touchUpInside
        )
        
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
}

#Preview {
    UIButtonViewRepresentation(theColor: .blue, textButton: "Button") {
        print("Hi")
    }
}
