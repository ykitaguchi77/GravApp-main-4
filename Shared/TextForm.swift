import SwiftUI

struct TextForm: View {
    private let title: String
    private var placeHolder: String
    var text: Binding<String>
    
    init(text: Binding<String>, title: String, placeHolder: String) {
        self.text = text
        self.title = title
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        VStack{
            Text(self.title).foregroundColor(.black)
            TextField(self.placeHolder, text: text)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
                .frame(minWidth:0, maxWidth:CGFloat.infinity)
                .font(.title2)
                .padding()
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1).opacity(0.8))
        }
    }
}
