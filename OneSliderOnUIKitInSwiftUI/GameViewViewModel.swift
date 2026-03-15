import Foundation
import Observation

@Observable final class GameViewViewModel {
    //  Инициализация экземпляра класса
    var gameOptions = GameOptions()
    //  При передачи true, должен будет отобразиться alert
    var alertIsPresented = false
    
    //  Вычисляем, насколько близко был сделан выбор
    var scores: Int {
        100 - abs(gameOptions.targetValue - lround(gameOptions.currentValue))
    }
    
    //  Получаем значение непрозрачности, которое необходимо в будущем присвоить
    var alpha: Double {
        Double(scores) / 100
    }
    
    //  Переключение показа Alert, чтобы
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    //  Сбросить значения, для того, чтобы начать игру заново
    func reset() {
        gameOptions.currentValue = Double.random(in: 0...100)
        gameOptions.targetValue = Int.random(in: 0...100)
    }
    
}
