import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Double
    let color: UIColor
    
    //  Аналог viewDidLoad (один раз вызвали)
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    //  Внутри используются объекты, которые обновляются в ходе жизненного цикла
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(value)
        view.thumbTintColor = color.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderViewRepresentation {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

#Preview {
    UISliderViewRepresentation(value: .constant(50), alpha: 1, color: .black)
}
