import SwiftUI

struct GameSliderView: View {
    //  Bindable - необходим для того, чтобы установить двустороннюю связь
    @Bindable var gameViewModel: GameViewViewModel
    let color: UIColor
    
    var body: some View {
        VStack {
            let targetValue = gameViewModel.gameOptions.targetValue
            Text("Подвиньте слайдер к значению \(targetValue)")
            HStack {
                Text("0")
                UISliderViewRepresentation(
                    //  Необходима двусторонняя связь, т.к. мы не только передаём значение, но и обновляем при взаимодействии значение с бегунком. Для этого необходимо использовать обёртку @Bindable у значения gameViewModel
                    value: $gameViewModel.gameOptions.currentValue,
                    alpha: gameViewModel.alpha,
                    color: color
                )
                Text("100")
            }
            .padding()
        }
    }
}

#Preview {
    GameSliderView(gameViewModel: GameViewViewModel(), color: .red)
}
