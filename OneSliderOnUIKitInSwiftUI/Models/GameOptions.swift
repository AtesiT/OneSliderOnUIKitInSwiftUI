import Foundation

struct GameOptions {
    //  TargetValue - то число, которое нам необходимо найти.
    var targetValue = Int.random(in: 0...100)
    //  Изначальное значение для слайдера
    var currentValue = Double.random(in: 0...100)
}
