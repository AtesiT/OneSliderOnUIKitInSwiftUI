import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                UITextViewRepresentation(theWord: "0", theColor: .black)
                    .fixedSize()
                UISliderViewRepresentation(sliderValue: .constant(50.0))
                UITextViewRepresentation(theWord: "100", theColor: .black)
                    .fixedSize()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
