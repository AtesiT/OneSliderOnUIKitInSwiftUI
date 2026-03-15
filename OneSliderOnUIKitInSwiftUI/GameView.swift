import SwiftUI

struct GameView: View {
    
    //  State вместо StateObject в Observation
    @State private var gameViewModel = GameViewViewModel()
    
    var body: some View {
        VStack {
            //  Передаем созданный нами экземпляр модели
            GameSliderView(gameViewModel: gameViewModel, color: .red)
            
            Button("Проверь меня!", action: gameViewModel.showAlert)
                .padding()
            //  Создаём Alert
                .alert(
                    "Your Score",
                    //  Мы не только передаем значение элементу интерфейса, но и необходимо это значение изменять при обновлении элемента интерфейса
                    isPresented: $gameViewModel.alertIsPresented,
                    actions: {
                    }
                ) {
                    Text(gameViewModel.scores.formatted())
            }
            
            Button("Начать заново", action: gameViewModel.reset)
        }
    }
}

#Preview {
    GameView()
}
