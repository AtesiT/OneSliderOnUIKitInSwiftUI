import SwiftUI

struct ContentView: View {
    //  Число, которое необходимо найти; Первоначальное значение слайдера; Булевое значение alert (показывается или скрыт)
    @State private var target = Int.random(in: 0...100)
    @State private var currentValue: Float = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            UITextViewRepresentation(theWord: "Подвиньте слайдер, как можно ближе к: \(target)", theColor: .black)
                .fixedSize()
                .padding()
            HStack {
                UITextViewRepresentation(theWord: "0", theColor: .black)
                    .fixedSize()
                UISliderViewRepresentation(sliderValue: $currentValue)
                UITextViewRepresentation(theWord: "100", theColor: .black)
                    .fixedSize()
            }
            //  Добавляем alert
            .alert("Результат", isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                let score = toDisplayResult()
                Text("Вы набрали \(score) баллов из 100!")
            }
            
            UIButtonViewRepresentation(theColor: .blue, textButton: "Проверь меня!") {
                showAlert = true
            }
                .fixedSize()
                .padding()
            UIButtonViewRepresentation(theColor: .blue, textButton: "Начать заново") {
                print("Start again")
            }
                .fixedSize()
        }
        .padding()
    }
    
    //  Функция для подсчёта очков с округлением числа в меньшую сторону
    func toDisplayResult() -> Int {
        let result = abs(target - lround(Double(currentValue)))
        return 100 - result
    }
}

#Preview {
    ContentView()
}
