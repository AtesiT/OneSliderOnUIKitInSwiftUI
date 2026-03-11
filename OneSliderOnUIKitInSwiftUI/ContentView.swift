import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            UITextViewRepresentation(theWord: "Подвиньте слайдер, как можно ближе к: ", theColor: .black)
                .fixedSize()
                .padding()
            HStack {
                UITextViewRepresentation(theWord: "0", theColor: .black)
                    .fixedSize()
                UISliderViewRepresentation(sliderValue: .constant(50.0))
                UITextViewRepresentation(theWord: "100", theColor: .black)
                    .fixedSize()
            }
            UIButtonViewRepresentation(theColor: .blue, textButton: "Проверь меня!")
                .fixedSize()
                .padding()
            UIButtonViewRepresentation(theColor: .blue, textButton: "Начать заново")
                .fixedSize()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
