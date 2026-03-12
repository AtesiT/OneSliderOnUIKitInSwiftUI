import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    var targetValue: Float = 100
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        
        // Используем abs
        let range = abs(uiView.value - targetValue)
        let maxRange = max(targetValue, Float(uiView.maximumValue - targetValue))
        let colorSlider = CGFloat(1.0 - (range / maxRange))
        
        //  Установка цвета
        uiView.thumbTintColor = UIColor(
            red: colorSlider,
            green: 1.0 - colorSlider,
            blue: 1.0 - colorSlider,
            alpha: 1.0
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
    
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            _sliderValue = sliderValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

#Preview {
    UISliderViewRepresentation(sliderValue: .constant(50))
}
