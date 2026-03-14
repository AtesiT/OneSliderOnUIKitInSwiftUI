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
        
        // Узнаём разницу между тем значением, что нужно было найти и тем, которое выбрал пользователь
        let range = abs(uiView.value - targetValue)
        
        //  Для установки значения Alpha (здесь будет 0. .. число)
        let alphaLevel = range / 100
        
        //  Установка цвета
        //  Красный остаётся 1.0, меняем сам green and blue
        uiView.thumbTintColor = UIColor(
            red: 1.0,
            green: CGFloat(alphaLevel),
            blue: CGFloat(alphaLevel),
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
