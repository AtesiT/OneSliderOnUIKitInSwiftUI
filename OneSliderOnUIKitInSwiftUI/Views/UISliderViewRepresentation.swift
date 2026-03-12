import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        sliderValue = uiView.value
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
